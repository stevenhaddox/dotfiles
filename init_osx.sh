#!/bin/sh

echo DQogICAgICAgICAgICAgIF8gICAgICAgICAgICAgXyAgXyAgIF8gICAgICAgICAgICAgICAgIF8gICAgICAgICAgICAgDQogICAgICAgICAgICAgfCB8ICAgICAgICAgICAoXyl8IHwgfCB8ICAgICAgICAgICAgICAgfCB8ICAgICAgICAgICAgDQogICAgICAgICAgICAgfCB8X18gICAgX18gXyAgXyB8IHwgfCB8X18gICBfICAgXyAgIF9ffCB8IF8gX18gIF9fIF8gDQogICAgICAgICAgICAgfCAnXyBcICAvIF9gIHx8IHx8IHwgfCAnXyBcIHwgfCB8IHwgLyBfYCB8fCAnX198LyBfYCB8DQogICAgICAgICAgICAgfCB8IHwgfHwgKF98IHx8IHx8IHwgfCB8IHwgfHwgfF98IHx8IChffCB8fCB8ICB8IChffCB8DQogICAgICAgICAgICAgfF98IHxffCBcX18sX3x8X3x8X3wgfF98IHxffCBcX18sIHwgXF9fLF98fF98ICAgXF9fLF98DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgX18vIHwgICAgICAgICAgICAgICAgICAgDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8X19fLyAgICAgICAgICAgICAgICAgICAg | base64 --decode
echo "\n\n"

# Add symlink for .init_osx.sh when needed
if [ ! -f ~/.init_osx.sh]; then
  ln -s ~/.homesick/repos/dotfiles/init_osx.sh ~/.init_osx.sh
fi

echo "#TODO: Remember to make the following preference changes:\n\n
* [ ] Map caps lock to escape
* [ ] Remove map for command-space (Spotlight)
* [ ] Install Divvy from MacUpdate
* [ ] Create desktops and assign apps to those windows
* [ ] Restore backup file for iTerm 2 profile (~/dotfiles/.colors/theme_iterm2) as per: https://gitlab.com/gnachman/iterm2/-/issues/8029\n\n"

read -p "Press any key to continue... " -n1 -s
echo  '\n'
mkdir ~/tmp
cd ~/tmp

# echo "Install OS X 10.14 (Mojave) SDK headers"
# TODO: This step is needed for Python 2.7.15 and 3.x to install via asdf
# sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /

echo Install Homebrew, cask, wget, git
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install mas
brew install wget
brew install gpg
brew install git
brew install jq
brew install tmux
brew install heroku
brew install teleport
brew install openjdk
brew install balena-cli

echo Installing asdf-vm and dependencies

# asdf suggested brew dependencies
brew install coreutils automake autoconf openssl libyaml readline libxslt libtool unixodbc
# ruby-build suggested brew dependencies
brew install libffi
# required for building Ruby <= 1.9.3-p0:
#brew tap homebrew/dupes && brew install apple-gcc42
brew install asdf

# asdf plugins
asdf plugin-add direnv
asdf install direnv 2.20.0
asdf global direnv 2.20.0
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin-add python https://github.com/tuvistavie/asdf-python.git
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
asdf plugin-add rust https://github.com/code-lever/asdf-rust.git
# asdf node.js plugin
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
export GNUPGHOME="bash /usr/local/opt/asdf/keyrings/nodejs" && mkdir -p "$GNUPGHOME" && chmod 0700 "$GNUPGHOME"
bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'

# asdf installs:
asdf install ruby latest
asdf install python latest:3
asdf install erlang latest
asdf install elixir latest
asdf install golang latest
asdf install rust latest
asdf install nodejs 12.20.1 #AWS lambdas run behind latest


# Brew Cask Apps
echo "--------------------------------------"
echo "Installng Brew Cask applications"
echo "--------------------------------------"
#NOTE: brew cask usage:
# brew search <app_name>
# brew install --cask --appdir="<app_path>" <app_name>
# brew uninstall --cask <app_name>
brew install --cask --appdir="/Applications" alfred
brew install --cask --appdir="/Applications" authy
brew install --cask --appdir="/Applications" bartender
brew install --cask --appdir="/Applications" discord
brew install --cask --appdir="/Applications" istat-menus
brew install --cask --appdir="/Applications" iterm2
brew install --cask --appdir="/Applications" macdown
brew install --cask --appdir="/Applications" google-chrome
brew install --cask --appdir="/Applications" mailplane
brew install --cask --appdir="/Applications" proxpn
brew install --cask --appdir="/Applications" viscosity
brew install --cask --appdir="/Applications" resilio-sync
brew install --cask --appdir="/Applications" kaleidoscope
brew install --cask --appdir="/Applications" gitkraken
brew install --cask --appdir="/Applications" atom
brew install --cask --appdir="/Applications" transmit
brew install --cask --appdir="/Applications" transmission
brew install --cask --appdir="/Applications" vlc
#brew install --cask --appdir="/Applications" java
brew install --cask --appdir="/Applications" docker
brew install --cask --appdir="/Applications" signal
brew install --cask --appdir="/Applications" keybase
brew install --cask --appdir="/Applications" zoom
brew install --cask --appdir="/Applications" daisydisk
brew install --cask --appdir="/Applications" balenaetcher
brew install --cask --appdir="/Applications" vagrant
brew install --cask --appdir="/Applications" vagrant-manager
#brew install --cask --appdir="/Applications" virtualbox
#brew install --cask --appdir="/Applications" little-snitch


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

# Install SFMono fonts globally:
cp -v /Applications/Utilities/Terminal.app/Contents/Resources/Fonts/SFMono-* ~/Library/Fonts

# Clone dotfiles when needed
if [ ! -d ~/.homesick/repos/dotfiles ]; then
  echo Installing homesick gem & dotfiles
  sudo gem install homesick
  homesick clone git@github.com:stevenhaddox/dotfiles.git
  homesick symlink dotfiles
  ln -s ~/.homesick/repos/dotfiles/home/os/.bash_osx ~/.bash_osx
fi

# Add symlink for direnv when needed
if [ ! -f ~/.direnvrc ]; then
  ln -s ~/.homesick/repos/dotfiles/home/.direnvrc ~/.direnvrc
fi

# Add symlink for asdf global .tool-versions when needed
if [ ! -f ~/.tool-versions ]; then
  ln -s ~/.homesick/repos/dotfiles/home/.tool-versions ~/.tool-versions
fi

# Install OhMyZsh when needed
if [ ! -d ~/.oh-my-zsh ]; then
  echo Installing OhMyZsh
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
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

#if [ ! -d ${HOME}/.pyenv/versions/2.7.15 ]; then
#  echo Installing Python 2.7.15 via pyenv
#  pyenv install 2.7.15
#  pyenv global 2.7.15
#  pyenv rehash
#  pip install --upgrade pip
#fi

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


# App Store Apps
echo "--------------------------------------"
echo "Installng App Store applications"
echo "--------------------------------------"
#NOTE: How to use mas:
# mas search "App Name"
# Returns the identifier string to properly install each app

# "Affinity Publisher"
mas install 881418622
# "Amphetamine"
mas install 937984704
# "Bitwarden"
mas install 1352778147
# "Byword"
mas install 420212497
# "Fantastical"
mas install 975937182
# "iOptron iPolar"
mas install 1494615698
# "Starry Landscape Stacker"
mas install 550326617
# "Raw Right Away"
mas install 963507809
# "Slack"
mas install 803453959
# "Line"
mas install 539883307
# "LastPass Password Manager"
mas install 926036361
# "Okta Extension App"
mas install 1439967473
# "Overlap by Moleskin"
mas install 1516950324
# "Clear"
mas install 504544917
# "iNet"
mas install 403304796
# "Moom"
mas install 419330170
# "Desktop Curtain"
mas install 414088151
# Key Codes
mas install 414568915
# Characters

# Site Sucker

# Drive Mounter

# ClamXav

# Airmail

# WipeFS


## Download from the App Store
# 1Password


#-----


# Extras
echo "--------------------------------------"
echo "Installng extra applications & misc..."
echo "--------------------------------------"

echo "\n\n"
echo fCB8IHwgfCAgICAgICAgICAgICAgICAgICAgICAgICB8IHwgfCB8ICAgICAgICAgIHwgfCAgKF8pICAgICAgICAgICB8IHwNCnwgfF98IHwgX18gXyBfIF9fICBfIF9fICBfICAgXyAgfCB8X3wgfCBfXyBfICBfX198IHwgX19fIF8gX18gICBfXyBffCB8DQp8ICBfICB8LyBfYCB8ICdfIFx8ICdfIFx8IHwgfCB8IHwgIF8gIHwvIF9gIHwvIF9ffCB8LyAvIHwgJ18gXCAvIF9gIHwgfA0KfCB8IHwgfCAoX3wgfCB8XykgfCB8XykgfCB8X3wgfCB8IHwgfCB8IChffCB8IChfX3wgICA8fCB8IHwgfCB8IChffCB8X3wNClxffCB8Xy9cX18sX3wgLl9fL3wgLl9fLyBcX18sIHwgXF98IHxfL1xfXyxffFxfX198X3xcX1xffF98IHxffFxfXywgKF8pDQogICAgICAgICAgICB8IHwgICB8IHwgICAgIF9fLyB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgX18vIHwgIA0KICAgICAgICAgICAgfF98ICAgfF98ICAgIHxfX18vICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfF9fXy8gICANCg== | base64 --decode
