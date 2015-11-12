# ==================================================================
# = When adding aliases, remember to execute: $ . ~/.bash_profile  =
# ==================================================================

# scripts
alias scripts='cd ~/.scripts'
alias crontab='VIM_CRONTAB=true crontab'

# Render the current folder via webrick! ($ rserve 3000)
alias rserve='ruby -run -e httpd . -p'

# Development aliases
alias chefdev='rbenv shell chefdk; rbenv rehash; chef shell-init bash'

# project aliases
alias sites='cd ~/Sites'
alias projects='cd ~/Sites/_projects'
alias cookbooks='cd ~/Sites/_cookbooks'
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
alias dns.flush='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
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
alias encrypt='gpg -e -r steven'
alias decrypt='gpg --decrypt'

# Certificates
function certinfo {
  if openssl req -text -noout -verify -in $1 > /dev/null 2>&1
  then
    echo "Cert Request File:"
    openssl req -subject -noout -verify -in $1
  elif openssl rsa -in $1 -check > /dev/null 2>&1
  then
    echo "RSA Private Key File, password once more please:"
    openssl rsa -in $1 -check
  elif openssl pkcs12 -info -in $1 -nodes > /dev/null 2>&1
  then
    echo "PKCS12, .p12 file, password once more please:"
    openssl pkcs12 -info -in $1 -nodes | openssl x509 -noout -subject -issuer
  elif openssl x509 -in $1 -text -noout > /dev/null 2>&1
  then
    echo "X509 Certificate:"
    openssl x509 -in $1 -subject -issuer -noout
  else
    echo "Unknown filetype."
  fi
}

extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)  tar xvjf $1 && cd $(basename "$1" .tar.bz2) ;;
      *.tar.gz)   tar xvzf $1 && cd $(basename "$1" .tar.gz) ;;
      *.tar.xz)   tar Jxvf $1 && cd $(basename "$1" .tar.xz) ;;
      *.bz2)      bunzip2 $1 && cd $(basename "$1" /bz2) ;;
      *.rar)      unrar x $1 && cd $(basename "$1" .rar) ;;
      *.gz)       gunzip $1 && cd $(basename "$1" .gz) ;;
      *.tar)      tar xvf $1 && cd $(basename "$1" .tar) ;;
      *.tbz2)     tar xvjf $1 && cd $(basename "$1" .tbz2) ;;
      *.tgz)      tar xvzf $1 && cd $(basename "$1" .tgz) ;;
      *.zip)      unzip $1 && cd $(basename "$1" .zip) ;;
      *.Z)        uncompress $1 && cd $(basename "$1" .Z) ;;
      *.7z)       7z x $1 && cd $(basename "$1" .7z) ;;
      *)          echo "don't know how to extract '$1'..." ;;
    esac
  else
    echo "'$1' is not a valid file!"
  fi
}

# DB Aliases live in ~/.bash_osx and ~/.bash_linux
