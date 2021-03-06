if [ -f ${HOME}/.bash_support ]; then
  #SUPPORT Generated .bashrc
  source ${HOME}/.bash_support
fi

# Get aliases and functions
PATH="${HOME}/bin:/usr/local/bin:/usr/local/sbin:${PATH}"
export PATH

export GPGKEY="43A1BCFC"

# Prompt/Title
export TITLEBAR='\[\033]0;\h \007\]'
export PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME} \007"' # iTerm
export PS1='\[\033[36m\]\W\[\033[m\] $(__git_ps1 "(\[\033[32m\]%s\[\033[m\]) ")\[\033[31m\]$\[\033[m\] '
export CLICOLOR=1

# Base 16 Theme for PuTTY and Bash
# Put the below into .bash_local if needed
BASE16_SHELL=$HOME/.colors/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# General settings
export EDITOR=vim
# spork DRB ports
export RSPEC_DRB=3001
export CUCUMBER_DRB=3002
# Vagrant
export VAGRANT_LOG=error
# tsocks proxy config
export TSOCKS_CONF_FILE=~/.tsocks
# vmail conf
export VMAIL_HTML_PART_READER='elinks -dump'

# Bash history preservation / sharing
# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# Important for Jekyll / encoding issues in Ruby 1.9
LANG=en_US.UTF-8
LC_ALL=en_US.UTF-8

# includes
if [ -f $HOME/.aliases ]; then
  source ~/.aliases
fi
if [ -d "/usr/local/heroku/bin" ]; then
  export PATH="${PATH}:/usr/local/heroku/bin"
fi
if [ -d $HOME/.scripts/ ]; then
  export PATH="${PATH}:/${HOME}/.scripts"
fi

if [ -d "/usr/local/share/npm/bin" ]; then
  export PATH="${PATH}:/usr/local/share/npm/bin"
fi

if [ -f $HOME/.bash_osx ]; then
  source ~/.bash_osx
fi
if [ -f $HOME/.bash_linux ]; then
  source ~/.bash_linux
fi

# Use base user python (virtualenv)
#if [ -f ~/venv/base/bin/activate ]; then
#  source ~/venv/base/bin/activate
#fi

# Since rvm and rbenv conflict, try one or the other
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then
  source $HOME/.rvm/scripts/rvm
elif [[ -s $HOME/.rbenv ]] ; then
  export PATH="${HOME}/.rbenv/bin:${PATH}"
  eval "$(rbenv init -)"
fi

# Python env
if [[ -d ${HOME}/.pyenv ]] ; then
  export PYENV_ROOT="${HOME}/.pyenv"
  export PATH="${PYENV_ROOT}/bin:${PATH}"
  eval "$(pyenv init -)"
fi

# Node env
if [[ -s ${HOME}/.nvm/nvm.sh ]] ; then
  export NVM_DIR="${HOME}/.nvm"
  [ -s "${NVM_DIR}/nvm.sh" ] && . "${NVM_DIR}/nvm.sh"  # This loads nvm
fi

if [ -f $HOME/.local_rc ]; then
  source ~/.local_rc
fi
