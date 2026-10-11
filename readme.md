# OpenEnergyMonitor Documentation

Source for [docs.openenergymonitor.org](https://docs.openenergymonitor.org).

The general guide lives in `main/`. Product and software docs live in the `docs/` folder of their own repositories (emonPi3, emonHub, emonCMS, ...), listed in [repos.conf](repos.conf). `update.sh` clones those repositories into this directory, and the symlinks in `main/` (e.g. `main/emoncms -> ../emoncms/docs`) pull them into the build.

## Build

Requires git and python3 with venv (`sudo apt install python3-venv`).

    git clone https://github.com/openenergymonitor/docs
    cd docs
    ./update.sh

This clones or updates every repository in `repos.conf`, installs Sphinx into a local `.docs-venv` from `requirements.txt`, and builds the html into `main/_live`.

While editing, rebuild without pulling and without a clean build:

    ./update.sh --quick

To serve the output with a local web server:

    sudo ln -s /path/to/docs/main/_live /var/www/html/docs

## Adding a repository

1. Add a line to `repos.conf`: directory name, clone url and branch.
2. Add the directory to `.gitignore`.
3. Link its docs into the build, e.g. `ln -s ../newrepo/docs main/newrepo`, and add it to a toctree in `main/index.rst`.

## Pushing changes to the doc repositories

The cloned repositories use https urls. To switch them to ssh for pushing:

    ./switch_git_urls_to_ssh.sh ssh
