My configuration files to keep sync'd between systems.

    # If Dropbox is installed & synced:
    $ ln -s ~/Dropbox/dotfiles ~/.homesick/repos/dotfiles
    $ git submodule update

    # Sans Dropbox:
    $ homesick clone git@github.com:stevenhaddox/dotfiles.git

    # Finally:
    $ ln -s ~/.homesick/repos/dotfiles/homes/os/.bash_(osx|linux) ~
    $ homesick symlink dotfiles
