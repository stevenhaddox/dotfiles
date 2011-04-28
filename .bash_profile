#PATH="/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:${PATH}"
PATH="/usr/local/bin:${PATH}"
export PATH

###
# General settings
export EDITOR=mate

###
# OS X terminal settings
export PS1='\[\033[36m\]\W\[\033[m\] $(__git_ps1 "(\[\033[32m\]%s\[\033[m\]) ")\[\033[31m\]$\[\033[m\] '
export CLICOLOR=1
export LSCOLORS="gxfxcxdxbxegedabagacad"
# LINUX:
# export LS_COLORS='di=36:ln=35:so=32;40:pi=33:ex=31:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=30;42:*.rb=31'

source ~/.git_completion.sh
source ~/.bash_aliases

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# RVM
if [[ -s /Users/steven/.rvm/scripts/rvm ]] ; then 
  source /Users/steven/.rvm/scripts/rvm ; 
fi
