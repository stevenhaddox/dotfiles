#!/bin/sh

echo DQogICAgICAgICAgICAgIF8gICAgICAgICAgICAgXyAgXyAgIF8gICAgICAgICAgICAgICAgIF8gICAgICAgICAgICAgDQogICAgICAgICAgICAgfCB8ICAgICAgICAgICAoXyl8IHwgfCB8ICAgICAgICAgICAgICAgfCB8ICAgICAgICAgICAgDQogICAgICAgICAgICAgfCB8X18gICAgX18gXyAgXyB8IHwgfCB8X18gICBfICAgXyAgIF9ffCB8IF8gX18gIF9fIF8gDQogICAgICAgICAgICAgfCAnXyBcICAvIF9gIHx8IHx8IHwgfCAnXyBcIHwgfCB8IHwgLyBfYCB8fCAnX198LyBfYCB8DQogICAgICAgICAgICAgfCB8IHwgfHwgKF98IHx8IHx8IHwgfCB8IHwgfHwgfF98IHx8IChffCB8fCB8ICB8IChffCB8DQogICAgICAgICAgICAgfF98IHxffCBcX18sX3x8X3x8X3wgfF98IHxffCBcX18sIHwgXF9fLF98fF98ICAgXF9fLF98DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgX18vIHwgICAgICAgICAgICAgICAgICAgDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8X19fLyAgICAgICAgICAgICAgICAgICAg | base64 --decode
echo "\n\n"

echo "Install all AppStore Apps at first!\n\n
Remember to make the following preference changes:
* Map caps lock to escape
* Remove map for command-space (Spotlight)
* Restore backup file for iTerm 2 profile (~/dotfiles/.colors/theme_iterm2)
* Create desktops and assign apps to those windows"

# no solution to automate AppStore installs

## get from App Store
# LastPass
# 1Password
# Slack
# Clear
# iNet
# Moom
# Line
# Desktop Curtain
# Pixelmator
# Key Codes
# Characters
# Site Sucker
# Drive Mounter
# ClamXav
# Airmail
# WipeFS

read -p "Press any key to continue... " -n1 -s
echo  '\n'
mkdir ~/tmp
cd ~/tmp

# echo "Install OS X 10.14 (Mojave) SDK headers"
# TODO: This step is needed for Python 2.7.15 and 3.x to install via asdf
# sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /

echo Install Homebrew, cask, wget, git
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install wget
brew install gpg
brew install git
brew install jq
brew install tmux
brew install heroku
brew install teleport

echo Installing asdf-vm and dependencies

# asdf suggested brew dependencies
brew install coreutils automake autoconf openssl libyaml readline libxslt libtool unixodbc
# ruby-build suggested brew dependencies
brew install libffi
# required for building Ruby <= 1.9.3-p0:
#brew tap homebrew/dupes && brew install apple-gcc42
brew install asdf

# asdf plugins
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin-add python https://github.com/tuvistavie/asdf-python.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
asdf plugin-add rust https://github.com/code-lever/asdf-rust.git
# asdf node.js plugin
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
export GNUPGHOME="bash /usr/local/opt/asdf/keyrings/nodejs" && mkdir -p "$GNUPGHOME" && chmod 0700 "$GNUPGHOME"
source /usr/local/opt/asdf/plugins/nodejs/bin/import-release-team-keyring

#brew cask search
#brew cask uninstall app

# Core Functionality
echo Install Core Apps
brew cask install --appdir="/Applications" alfred
brew cask install --appdir="/Applications" bartender
brew cask install --appdir="/Applications" istat-menus
brew cask install --appdir="/Applications" iterm2
brew cask install --appdir="/Applications" macdown
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" mailplane
brew cask install --appdir="/Applications" proxpn
brew cask install --appdir="/Applications" viscosity
brew cask install --appdir="/Applications" resilio-sync
brew cask install --appdir="/Applications" kaleidoscope
brew cask install --appdir="/Applications" gitkraken
brew cask install --appdir="/Applications" atom
brew cask install --appdir="/Applications" transmit
brew cask install --appdir="/Applications" transmission
brew cask install --appdir="/Applications" vlc
brew cask install --appdir="/Applications" java
brew cask install --appdir="/Applications" docker
brew cask install --appdir="/Applications" signal
brew cask install --appdir="/Applications" keybase
brew cask install --appdir="/Applications" zoomus
brew cask install --appdir="/Applications" daisydisk
brew cask install --appdir="/Applications" virtualbox
brew cask install --appdir="/Applications" vagrant
brew cask install --appdir="/Applications" vagrant-manager
#brew cask install --appdir="/Applications" little-snitch

# Install Inconsolata Nerd Font if needed
if [ ! -f /Library/Fonts/Inconsolata\ Nerd\ Font\ Complete.otf ]; then
  echo Install Incosolata NerdFont
  mkdir -p ~/tmp/fonts
  rm -rf ~/tmp/fonts/*
  cd ~/tmp/fonts
  curl -L -O https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Inconsolata.zip
  unzip Inconsolata.zip
  sudo cp Inconsolata\ Nerd\ Font\ Complete.otf /Library/Fonts
  cd ~/tmp
fi

# Clone dotfiles when needed
if [ ! -d ~/.homesick/repos/dotfiles ]; then
  echo Installing homesick gem & dotfiles
  sudo gem install homesick
  homesick clone git@github.com:stevenhaddox/dotfiles.git
  homesick symlink dotfiles
  ln -s ~/.homesick/repos/dotfiles/home/os/.bash_osx ~
fi

# Install OhMyZsh when needed
if [ ! -f ~/.zshrc ]; then
  echo Installing OhMyZsh
  git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  rm -rf ~/.zshrc
  ln -s ~/.homesick/repos/dotfiles/home/.zshrc ~/.zshrc
fi

# Initialize rbenv and ruby-build
rbenv-init
# Verify rbenv installation
echo "Verifying rbenv installation"
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash

# Install rb CLI shell tool
if [ ! -f /usr/local/bin/rb ]; then
  echo Installing rb CLI shell tool
  sudo curl https://raw.githubusercontent.com/thisredone/rb/master/rb -o /usr/local/bin/rb && sudo chmod +x /usr/local/bin/rb
  # Unalias rb to fix "ruby: aliased to ruby"
  unalias rb
fi

if [ ! -d ${HOME}/.pyenv/versions/2.7.15 ]; then
  echo Installing Python 2.7.15 via pyenv
  pyenv install 2.7.15
  pyenv global 2.7.15
  pyenv rehash
  pip install --upgrade pip
fi

# Install AWS CLI
if [ ! -f ${HOME}/.pyenv/shims/aws ]; then
  echo "Installing AWS CLI"
  pip install awscli --upgrade
fi

# Install Okta AWS profile switcher (requires Java)
if [ ! -f ~/.okta/okta-aws-cli.jar ]; then
  echo Installing okta AWS CLI role tool
  mkdir -p ~/sync/.okta
  ln -s ~/sync/.okta ~/.okta
  curl 'https://raw.githubusercontent.com/oktadeveloper/okta-aws-cli-assume-role/master/bin/install.sh' | bash
fi

# Extras
echo "--------------------------------------"
echo "Installng extra applications & misc..."
echo "--------------------------------------"

# Install Convox
brew install convox

echo "\n\n"
echo fCB8IHwgfCAgICAgICAgICAgICAgICAgICAgICAgICB8IHwgfCB8ICAgICAgICAgIHwgfCAgKF8pICAgICAgICAgICB8IHwNCnwgfF98IHwgX18gXyBfIF9fICBfIF9fICBfICAgXyAgfCB8X3wgfCBfXyBfICBfX198IHwgX19fIF8gX18gICBfXyBffCB8DQp8ICBfICB8LyBfYCB8ICdfIFx8ICdfIFx8IHwgfCB8IHwgIF8gIHwvIF9gIHwvIF9ffCB8LyAvIHwgJ18gXCAvIF9gIHwgfA0KfCB8IHwgfCAoX3wgfCB8XykgfCB8XykgfCB8X3wgfCB8IHwgfCB8IChffCB8IChfX3wgICA8fCB8IHwgfCB8IChffCB8X3wNClxffCB8Xy9cX18sX3wgLl9fL3wgLl9fLyBcX18sIHwgXF98IHxfL1xfXyxffFxfX198X3xcX1xffF98IHxffFxfXywgKF8pDQogICAgICAgICAgICB8IHwgICB8IHwgICAgIF9fLyB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgX18vIHwgIA0KICAgICAgICAgICAgfF98ICAgfF98ICAgIHxfX18vICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfF9fXy8gICANCg== | base64 --decode
