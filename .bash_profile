PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/git/bin:/opt/local/bin:/opt/local/sbin:/opt/subversion/bin:${PATH}"
export PATH

###
# General settings
export EDITOR=mate

###
# OS X terminal settings
export PS1='\[\033[36m\]\W\[\033[m\] $(__git_ps1 "(\[\033[32m\]%s\[\033[m\]) ")\[\033[31m\]$\[\033[m\] '
export CLICOLOR=1
export LSCOLORS="ExFxCxDxBxegedabagacad"
export LSCOLORS="gxfxcxdxbxegedabagacad"

source ~/.git_completion.sh
source ~/.bash_aliases

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# RVM
if [[ -s /Users/steven/.rvm/scripts/rvm ]] ; then 
  source /Users/steven/.rvm/scripts/rvm ; 
fi
