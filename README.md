My configuration files to keep sync'd between systems.

On OS X:

    $ ./init_osx.sh
    $ ln -s ~/.homesick/repos/dotfiles/homes/.bash_os/.bash_osx ~

On Linux:

    $ gem install homesick
    $ homesick clone git@github.com:stevenhaddox/dotfiles.git
    $ homesick symlink dotfiles
    $ ln -s ~/.homesick/repos/dotfiles/homes/.bash_os/.bash_linux ~
