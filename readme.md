# OpenEnergyMonitor Documentation

## Local Preview

The docs can be built and previewed locally:

### 1. Clone repo and sub-modules 

    git clone https://github.com/openenergymonitor/guide-rtd
    git submodule update --init

### 2. Install Sphinx

See: [http://www.sphinx-doc.org/en/master/usage/installation.html](http://www.sphinx-doc.org/en/master/usage/installation.html)

    pip3 install -U sphinx

### 3. Install The Theme

    pip3 install sphinx_rtd_theme

### 4. Install Plugins

    pip3 install m2r myst-parser

### 5. Build the docs

    cd main
    make clean
    make html

This will generate html output in a `build` folder. The html can then be displayed using a local web server.

## Update

    git submodule update --recursive --remote
