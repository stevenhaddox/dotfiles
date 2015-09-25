My configuration files to keep sync'd between systems.

    # If Dropbox is installed & synced:
    $ ln -s ~/Dropbox/dotfiles ~/.homesick/repos/dotfiles
    # Otherwise:
    $ homesick clone git@github.com:stevenhaddox/dotfiles.git

    # Update submodules
    $ git submodule update

    # Finally:
    $ ln -s ~/.homesick/repos/dotfiles/homes/os/.bash_(osx|linux) ~
    $ homesick symlink dotfiles
