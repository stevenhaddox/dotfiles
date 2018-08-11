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
# DaisyDisk
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

echo Install Homebrew, cask, wget, git
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install wget
brew install git
brew install tmux
brew install docker
brew install go
brew install pyenv
brew install rbenv
brew install heroku

#brew cask search
#brew cask uninstall app

# Core Functionality
echo Install Core Apps
brew cask install --appdir="/Applications" alfred
brew cask install --appdir="/Applications" bartender
brew cask install --appdir="/Applications" caffeine
brew cask install --appdir="/Applications" istat-menus
brew cask install --appdir="/Applications" iterm2
brew cask install --appdir="/Applications" macdown
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" mailplane
brew cask install --appdir="/Applications" proxpn
brew cask install --appdir="/Applications" resilio-sync
brew cask install --appdir="/Applications" atom
brew cask install --appdir="/Applications" transmit
brew cask install --appdir="/Applications" transmission
brew cask install --appdir="/Applications" vlc
brew cask install --appdir="/Applications" java
brew cask install --appdir="/Applications" zoomus
#brew cask install --appdir="/Applications" dropbox
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

echo "\n\n"
echo fCB8IHwgfCAgICAgICAgICAgICAgICAgICAgICAgICB8IHwgfCB8ICAgICAgICAgIHwgfCAgKF8pICAgICAgICAgICB8IHwNCnwgfF98IHwgX18gXyBfIF9fICBfIF9fICBfICAgXyAgfCB8X3wgfCBfXyBfICBfX198IHwgX19fIF8gX18gICBfXyBffCB8DQp8ICBfICB8LyBfYCB8ICdfIFx8ICdfIFx8IHwgfCB8IHwgIF8gIHwvIF9gIHwvIF9ffCB8LyAvIHwgJ18gXCAvIF9gIHwgfA0KfCB8IHwgfCAoX3wgfCB8XykgfCB8XykgfCB8X3wgfCB8IHwgfCB8IChffCB8IChfX3wgICA8fCB8IHwgfCB8IChffCB8X3wNClxffCB8Xy9cX18sX3wgLl9fL3wgLl9fLyBcX18sIHwgXF98IHxfL1xfXyxffFxfX198X3xcX1xffF98IHxffFxfXywgKF8pDQogICAgICAgICAgICB8IHwgICB8IHwgICAgIF9fLyB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgX18vIHwgIA0KICAgICAgICAgICAgfF98ICAgfF98ICAgIHxfX18vICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfF9fXy8gICANCg== | base64 --decode
