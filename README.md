My configuration files to keep sync'd between systems.

    # Sans Dropbox:
    $ homesick clone git@github.com:stevenhaddox/dotfiles.git

On OS X:

    $ ./init_osx.sh

Then:

    $ ln -s ~/.homesick/repos/dotfiles/homes/os/.bash_(osx|linux) ~
    $ homesick symlink dotfiles
