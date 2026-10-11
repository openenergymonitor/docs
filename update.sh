#!/bin/bash
# Fetch the docs repositories listed in repos.conf and build the docs into main/_live
#
#   ./update.sh          pull this repo and all doc repos, clean build
#   ./update.sh --quick  no pulls, incremental build (for local editing)

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENV_DIR="$ROOT_DIR/.docs-venv"
VENV_BIN="$VENV_DIR/bin"

quick=0
case "$1" in
    "") ;;
    --quick) quick=1 ;;
    *) echo "Usage: $0 [--quick]"; exit 1 ;;
esac

cd "$ROOT_DIR" || exit 1

fetch_repos() {
    git pull --ff-only

    grep -vE '^\s*(#|$)' repos.conf | while read -r name url branch
    do
        echo "== $name ($branch)"

        # -e rather than -d: a former submodule checkout has a .git file
        if [ ! -e "$name/.git" ]
        then
            git clone --branch "$branch" "$url" "$name"
            continue
        fi

        if [ -n "$(git -C "$name" status --porcelain --untracked-files=no)" ]
        then
            echo "Skipping $name: local changes present (commit/stash first)."
            continue
        fi

        if [ "$(git -C "$name" rev-parse --abbrev-ref HEAD)" != "$branch" ]
        then
            git -C "$name" fetch origin "$branch" &&
            git -C "$name" checkout "$branch" || { echo "Skipping $name: could not check out $branch."; continue; }
        fi

        git -C "$name" pull --ff-only
    done
}

ensure_sphinx() {
    if [ ! -x "$VENV_BIN/python" ]
    then
        echo "Creating local virtual environment at $VENV_DIR"
        python3 -m venv "$VENV_DIR" || { echo "Failed to create venv. Install python3-venv and retry."; return 1; }
    fi

    # Reinstall only when requirements.txt has changed since the last install
    if ! cmp -s requirements.txt "$VENV_DIR/requirements.installed"
    then
        echo "Installing Sphinx dependencies in local venv"
        "$VENV_BIN/pip" install -r requirements.txt || return 1
        cp requirements.txt "$VENV_DIR/requirements.installed"
    fi
}

if [ "$quick" = 0 ]
then
    fetch_repos
fi

ensure_sphinx || { echo "Skipping docs build: could not prepare local Sphinx environment."; exit 1; }

cd main || exit 1

if [ "$quick" = 0 ]
then
    make clean SPHINXBUILD="$VENV_BIN/sphinx-build" || exit 1
fi

if ! make html SPHINXBUILD="$VENV_BIN/sphinx-build"
then
    echo "Docs build failed. See the output above."
    exit 1
fi

# Copy rather than move so _build stays intact for incremental --quick builds
rm -rf _live
cp -a _build/html _live
echo "Docs built to main/_live"
