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

# Important for Jekyll / encoding issues in Ruby 1.9
LANG=en_US.UTF-8
LC_ALL=en_US.UTF-8

# includes
if [ -f $HOME/.bash_aliases ]; then
  source ~/.bash_aliases
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
if [ -f $HOME/.bash_local ]; then
  source ~/.bash_local
fi

# Use base user python (virtualenv)
#if [ -f ~/venv/base/bin/activate ]; then
#  source ~/venv/base/bin/activate
#fi

# Since rvm and rbenv conflict, try one or the other
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then
  source $HOME/.rvm/scripts/rvm
elif [[ -s $HOME/.rbenv ]] ; then
  PATH="${HOME}/.rbenv/bin:${PATH}"
  export PATH
  eval "$(rbenv init -)"
fi

if [[ -s $HOME/.nvm/nvm.sh ]] ; then
  export NVM_DIR="${HOME}/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
fi
