# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'OpenEnergyMonitor'
copyright = '2023, OpenEnergyMonitor'
author = 'Trystan'
release = '0.0.1'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = ["myst_parser","sphinx_copybutton"]
myst_enable_extensions = ["html_image"]

templates_path = ['_templates']
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store', 'README.md', '**/README.md']
# include_patterns = ['index.rst','modules/emontx4/docs/*']


# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = 'sphinx_rtd_theme'
html_static_path = ['_static']
html_favicon = '_static/favicon.png'
html_baseurl = 'https://docs.openenergymonitor.org/en/latest/'

html_context = {
    "display_github": True, # Integrate GitHub
    "github_user": "openenergymonitor", # Username
    "github_repo": "docs", # Repo name
    "github_version": "main", # Version
    "conf_py_path": "/main/", # Path in the checkout to the docs root
}

html_theme_options = {
  'navigation_depth': 3
}
myst_heading_anchors = 3


# -- "Edit on GitHub" links for pages from the doc repos ----------------------
# Pages under a main/ symlink (e.g. main/emonsd -> ../EmonScripts/docs) live in
# the repo listed in repos.conf, not in this one: point their link there.

import os

def doc_repo_links():
    docs_root = os.path.dirname(os.path.abspath(__file__))

    repos = {}
    with open(os.path.join(docs_root, '..', 'repos.conf')) as f:
        for line in f:
            fields = line.split()
            if len(fields) == 3 and not fields[0].startswith('#'):
                name, url, branch = fields
                repos[name] = (url, branch)

    links = {}
    for entry in os.listdir(docs_root):
        path = os.path.join(docs_root, entry)
        if not os.path.islink(path):
            continue
        # e.g. ['..', 'EmonScripts', 'docs']
        parts = os.path.normpath(os.readlink(path)).split(os.sep)
        if len(parts) < 2 or parts[0] != '..' or parts[1] not in repos:
            continue
        url, branch = repos[parts[1]]
        links[entry] = '/'.join([url, 'blob', branch] + parts[2:])
    return links

DOC_REPO_LINKS = doc_repo_links()

def set_github_url(app, pagename, templatename, context, doctree):
    # Generated pages (genindex, search) have no source file to edit
    if templatename != 'page.html':
        context['display_github'] = False
        return
    top, _, rest = pagename.partition('/')
    if top in DOC_REPO_LINKS and rest:
        # Overrides any github_url front matter, as some of it is stale
        meta = context.get('meta') or {}
        meta['github_url'] = '%s/%s%s' % (DOC_REPO_LINKS[top], rest, context.get('page_source_suffix', ''))
        context['meta'] = meta

def setup(app):
    app.connect('html-page-context', set_github_url)
