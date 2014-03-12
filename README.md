python-environments
===================

Requirements files and scripts I use for setting up Python virtualenv
environments with pip.

This repository contains [pip](http://www.pip-installer.org/en/latest/)
requirements files and scripts for setting up Python
[virtualenv](http://www.virtualenv.org/en/latest/) environments.

Using `pip` with `virtualenv` is a great way to keep configuration control
over multiple python environments. One of the current limitations of pip is
the [inability to have duplicate requirements](https://github.com/pypa/pip/issues/174).
So to get around this limitation (without reproducing requirements over & over
in independent requirements files), some of the requirements files contained
here are incremental, relative to others they include.

* `blog.txt` - Requirements for building for [blog.bogatron.net](http://blog.bogatron.net) (a Pelican-powered blog)
* `spectral-deps.txt` - Requirements for using [Spectral Python](http://spectralpython.net) (not including wxPython)
* `spectral-web-deps.txt` - Requirements for building the Spectral Python web site (with Sphinx)
* `working.txt` - Additional packages for my default working environment

* `setup-working-env.sh` - This script sets up my working environment. It is system-specific, as it contains variables specifying several local directory names. It is a script (rather than a simple requirements file) because does a few additional setup tasks:
  * It installs `numpy` and `scipy` packages that were locally compiled to enable
  multithreading with OpenBLAS.
  * It installs SPy in editable mode from a local git repository.
  * It installs wxPython in a non-standard way (since it is not available via PyPI).

The way that wxPython is installed by the setup script is dangerous so I don't
recommend you modify the script to run on your own system. In fact, don't even
look at the contents of the script because I don't want you to be tempted to
install wxPython in your virtualenv that way. Crap. Now you're probably even
more curious to look in the script to see what it does. But don't do it, ok?
Hey, I've got an idea. How about you go look at this super interesting thing over
[here](http://www.google.com/images?q=lolcats).