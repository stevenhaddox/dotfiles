#PATH="/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:${PATH}"
PATH="/usr/local/bin:${PATH}"
export PATH

###
# Dev Application ENV settings
export F4T_FLICKR_KEY=c3c9b0deb49e0a8884f7f2eed6c1f18d
export F4T_FLICKR_SECRET=0ee8abe41041e1d7
export F4T_TWITTER_TOKEN=BykDPJuN58E9j8QYpAWfQA
export F4T_TWITTER_SECRET=BkzXx7okCj8P9lccx1Cx43uCbhC3Wz7TWaN9CnTWA

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
