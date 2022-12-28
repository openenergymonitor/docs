OpenEnergyMonitor User Guide using Read the Docs

### Local Preview

The docs can be built and previewed locally:

#### Clone repo and sub-modules 

`git clone https://github.com/openenergymonitor/guide-rtd`

`git submodule update --init`

#### Install Sphinx

See: [http://www.sphinx-doc.org/en/master/usage/installation.html](http://www.sphinx-doc.org/en/master/usage/installation.html)

`pip3 install -U sphinx`

#### Install The Theme

`pip3 install sphinx_rtd_theme`

#### Install Plugins

`pip3 install m2r myst-parser`

#### Build the docs

`make html`

This will generate html output in a `build` folder. The html can then be displayed using a local web server.



