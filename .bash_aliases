# ==================================================================
# = When adding aliases, remember to execute: $ . ~/.bash_profile  =
# ==================================================================

# VM ssh tunnel aliases
alias vm80="ssh -f strands@strands.vm -L 1380:strands.vm:80 -N"
alias vm443="ssh -f strands@strands.vm -L 13443:strands.vm:443 -N"

# server aliases
alias sandbox="ssh 174.143.173.240"
alias vhosts="cd /etc/apache2/vhosts/"

# Networking
alias ssh-imac="ssh steven@PEARL.local"
alias ssh-mbp="ssh steven@slk-mbp.local"
alias checkvpn="netstat -rn | grep 192.168" #check if VPN is working 

# project aliases
alias sites="cd ~/Sites"
alias projects="cd ~/Sites/_projects"
alias iphone="cd ~/Sites/iPhone"
alias dotfiles="cd ~/Dropbox/dotfiles"
alias rvm_fw="cd ~/Sites/_projects/rvm_fw"
alias presentor="cd ~/Sites/_projects/presentor"
alias f4t="cd ~/Sites/SLKd/flickr4twitter.com"
alias presentations="cd ~/Sites/presentations"

# work aliass
alias work="cd ~/Sites/work"
alias strands="cd ~/Sites/work/strands/releases/strands.new"
alias strands.old="cd ~/Sites/work/strands/releases/strands.old"

# SLKd aliases
alias slkd="cd ~/Sites/SLKd"
alias greenbean="cd ~/Sites/SLKd/greenbeanroasting.com"
alias lafun="cd ~/Sites/SLKd/lafuntickets.net"
alias seedhouse="cd ~/Sites/SLKd/seedhousestationers.com"
alias willvastine="cd ~/Sites/SLKd/willvastine.com"
alias wurs="cd ~/Sites/SLKd/msi/wurs"

# Personal aliases
alias slkd="cd ~/Sites/slkdesign.net"
alias blog="cd ~/Sites/blog.stevenhaddox.com"
alias blueprint="cd ~/Sites/src/blueprint/lib"
alias shaddox="cd ~/Sites/stevenhaddox.com"
alias khaddox="cd ~/Sites/katiehaddox.com"
alias katiecupcake="cd ~/Sites/katiecupcake.blogspot.com"
alias phaddox="cd ~/Sites/paisleyhaddox.com"
alias slk="cd ~/Sites/stevenloveskatie.com"
alias whyte="cd ~/Sites/thewhytelife.com"

alias weblogs="tail -f /var/log/apache2/*_log"
alias errorlog="tail -f /var/log/apache2/error_log"

# command aliases
alias b="bundle exec"
alias bc="bundle console"
alias flush='sudo dscacheutil -flushcache'
alias o='open ./'
alias m='mate'
alias edit='open -a Byword'

#This fixes the blue tint problem as described here: http://tinyurl.com/mac-blue-tint
alias fixtint='/System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/CoreGraphics.framework/Versions/A/Resources/DMProxy'
alias mailoptimize="sqlite3 ~/Library/Mail/Envelope\ Index vacuum index; sqlite3 ~/Library/Mail/Envelope\ Index vacuum subjects;"
alias showhidden='defaults write com.apple.finder AppleShowAllFiles -bool TRUE; killall Finder'
alias hidehidden='defaults write com.apple.finder AppleShowAllFiles -bool FALSE; killall Finder'
alias growl="growlnotify -m"
alias ok='afplay /System/Library/Sounds/Glass.aiff'
alias ll='ls -la'
alias lt='ls -ltra'
alias la='ls -alF'
alias l='ls -CFa'
alias ag='ack'

## System Monitoring
alias cpu='top -F -R -o cpu -n 10'

# LAMP
alias ap.1="sudo apachectl start"
alias ap.0="sudo apachectl stop"
alias ap.rs="sudo apachectl restart"
alias mysql.1='mysql.server start'
alias mysql.0='mysql.server stop'
alias mysql.rs='mysql.server restart'

# PostgreSQL (installed with Homebrew)
alias pg.1="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pg.0="pg_ctl -D /usr/local/var/postgres stop -s -m fast"

