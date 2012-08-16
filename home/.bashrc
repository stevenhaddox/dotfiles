# Get aliases and functions
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

PATH="/usr/local/bin:/usr/local/sbin:${PATH}"
export PATH

# Prompt/Title
export TITLEBAR='\[\033]0;\h \007\]'
export PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME} \007"' # iTerm
export PS1='\[\033[36m\]\W\[\033[m\] $(__git_ps1 "(\[\033[32m\]%s\[\033[m\]) ")\[\033[31m\]$\[\033[m\] '
export CLICOLOR=1

# General settings
export EDITOR=vim
export RACK_ENV=development
# spork DRB ports
export RSPEC_DRB=3001
export CUCUMBER_DRB=3002
# tsocks proxy config
export TSOCKS_CONF_FILE=~/.tsocks
# vmail conf
export VMAIL_HTML_PART_READER='elinks -dump'

# Important for Jekyll / encoding issues in Ruby 1.9
LANG=en_US.UTF-8
LC_ALL=en_US.UTF-8

# includes
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi
if [ -f ~/.bash_osx ]; then
  source ~/.bash_osx
fi
if [ -f ~/.bash_linux ]; then
  source ~/.bash_linux
fi
if [ -f ~/.bash_local ]; then
  source ~/.bash_local
fi

if [[ -s $HOME/.rvm/scripts/rvm ]] ; then 
  source $HOME/.rvm/scripts/rvm ; 
fi
