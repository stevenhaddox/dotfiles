# ==================================================================
# = When adding aliases, remember to execute: $ . ~/.bash_profile  =
# ==================================================================

alias ls='ls --color=tty'

# scripts
alias scripts='cd ~/.scripts'
alias crontab='VIM_CRONTAB=true crontab'

# Render the current folder via webrick! ($ rserve 3000)
alias rserve='ruby -run -e httpd . -p'

# project aliases
alias sites='cd ~/Sites'
alias projects='cd ~/Sites/_projects'
alias iphone='cd ~/Sites/iPhone'
alias dotfiles='cd ~/.homesick/repos/dotfiles/home'
alias rvm_fw='cd ~/Sites/_projects/rvm_fw'
alias presentations='cd ~/Sites/presentations'

# work aliass
alias proxy='proxychains4'
alias proxychains='proxychains4'
alias sproxy='ssh -N tunnel.slk'
alias wproxy='ssh -N onyx'
alias work='cd ~/Sites/work'
alias sshuttle='~/scripts/sshuttle/sshuttle --dns -Nr'
alias slkd='cd ~/Sites/SLKd'

# Personal aliases
alias blog='cd ~/Sites/blog.stevenhaddox.com'
alias shaddox='cd ~/Sites/stevenhaddox.com'
alias khaddox='cd ~/Sites/katiehaddox.com'
alias katiecupcake='cd ~/Sites/katiecupcake.blogspot.com'
alias slk='cd ~/Sites/stevenloveskatie.com'

# Logs
alias tail.logs='tail -f /var/log/apache2/*log /var/log/httpd/*log /var/log/mysql*.log ./*.log ./log/*.log'
alias tail.rails='tail -f log/*'
alias tail.apache='tail -f /var/log/apache2/*log /var/log/httpd/*log'
alias tail.errors='tail -f /var/log/apache2/error* /var/log/httpd/error*'
alias tail.mysql='tail -f /var/log/mysql-query.log'

# command aliases
alias ll='ls -la'
alias lt='ls -ltra'
alias la='ls -alF'
alias l='ls -CFa'
alias cl='clear'
alias ag='ack'
alias b='bundle exec'
alias bc='bundle console'
alias dns.flush='sudo dscacheutil -flushcache'
alias o='open ./'
alias edit='open -a Byword'
alias marked='open -a Marked'
alias vi='vim'
alias size_dir='du -hs'
alias subdirs="find -depth -type d |sed 'h; :b; $b; N; /^\(.*\)\/.*\n\1$/ { g; bb }; $ {x; b}; P; D' | sort"

# Apache permissions
alias chmod_public='find public -type f -print0 | xargs -0 chmod 664; find public -type d -print0 | xargs -0 chmod 755'

## System Monitoring
alias cpu='top -F -R -o cpu -n 10'

# GPG
alias encrypt-self='gpg --recipients steven@haddox.us --armor --encrypt'
alias decrypt='gpg --decrypt'

# DB Aliases live in ~/.bash_osx and ~/.bash_linux
