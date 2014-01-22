# Setting Up Powerline

Instructions added-to / modified from [Powerline Installation](https://powerline.readthedocs.org/en/latest/installation/linux.html#installation-linux)

## Install Dependencies

In order to install Powerline you'll need to ensure you're Python instance has the zlib module installed.

### Install setuptools

    $ cd dotfiles/home/src/powerline_deps
    $ tar -xzvf setuptools-2.1.tar.gz
    $ cd setuptools-2.1
    $ python setup.py install --user

### Install pip

    $ cd dotfiles/home/src/powerline_deps
    $ tar -xzvf pip-1.5.tar.gz
    $ cd pip-1.5
    $ python setup.py install --user

### Install psutil

    $ cd dotfiles/home/src/powerline_deps
    $ tar -xzvf psutil-1.2.1.tar.gz
    $ cd psutil-1.2.1
    $ python setup.py install --user

## Install Fonts

Ensure these fonts are available on your system. Also ensure your terminal client has one of these fonts installed locally and set as your font.

    $ mkdir ~/.fonts
    $ mkdir ~/.fonts.conf.d/
    $ cp 10-powerline-symbols.conf ~/.fonts.conf.d
    $ cp PowerlineSymbols.otf to ~/.fonts/
    $ cp fonts/Inconsolata/*.otf ~/.fonts/
    $ cp fonts/DejaVuSansMono/*.ttf ~/.fonts/
    $ cp fonts/AnonymousPro/*.ttf ~/.fonts/
    $ fc-cache -vf ~/.fonts

## Install Powerline

    $ cd dotfiles/home/src/powerline
    $ python setup.py install --user
    # Update write permissions on python-eggs folder:
    $ chmod g-wx,o-wx ~/.python-eggs

## Powerline Confs

    # .bashrc / .bash_local (wherever you prefer as long as it's sourced):
    export POWERLINE=${HOME}/.local/lib/python2.7/site-packages/Powerline-beta-py2.7.egg/powerline
    export PATH=$PATH:${HOME}/.local/bin

    if [ -f $POWERLINE/bindings/bash/powerline.sh ]; then
      source $POWERLINE/bindings/bash/powerline.sh
    fi
