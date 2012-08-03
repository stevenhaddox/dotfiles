# ==================================================================
# = When adding aliases, remember to execute: $ . ~/.bash_profile  =
# ==================================================================

# VM ssh tunnel aliases
alias vm80="ssh -f strands@strands.vm -L 1380:strands.vm:80 -N"
alias vm443="ssh -f strands@strands.vm -L 13443:strands.vm:443 -N"

# server aliases
alias sandbox="ssh 174.143.173.240"
alias vhosts="cd /etc/apache2/vhosts/"

# project aliases
alias sites="cd ~/Sites"
alias projects="cd ~/Sites/_projects"
alias iphone="cd ~/Sites/iPhone"
alias dotfiles="cd ~/.homesick/repos/dotfiles/home"
alias rvm_fw="cd ~/Sites/_projects/rvm_fw"
alias presentor="cd ~/Sites/_projects/presentor"
alias f4t="cd ~/Sites/SLKd/flickr4twitter.com"
alias presentations="cd ~/Sites/presentations"

# work aliass
alias proxy="proxychains4"
alias proxychains="proxychains4"
alias sproxy="ssh -N tunnel.slk"
alias wproxy="ssh -N onyx"
alias work="cd ~/Sites/work"
alias sshuttle="~/scripts/sshuttle/sshuttle --dns -Nr"
alias strands="cd ~/SitesPrivate/strands/releases/strands.new"
alias strands.old="cd ~/SitesPrivate/strands/releases/strands.old"

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

# Logs
alias tail.logs="tail -f /var/log/apache2/*log /var/log/httpd/*log /var/log/mysql*.log ./*.log ./log/*.log"
alias tail.rails="tail -f log/*"
alias tail.apache="tail -f /var/log/apache2/*log "
alias tail.errors="tail -f /var/log/apache2/error*"
alias tail.mysql="tail -f /var/log/mysql-query.log"

# command aliases
alias b="bundle exec"
alias bc="bundle console"
alias chmod_public="find public -type f -print0 | xargs -0 chmod 664" # Apache permissions
alias dns.flush='sudo dscacheutil -flushcache'
alias o='open ./'
alias m='mate'
alias edit='open -a Byword'
alias spotlight_off='sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist'
alias spotlight_on='sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist'
alias spotlight_hide='sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search; killall SystemUIServer'
alias spotlight_show='sudo chmod 755 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search; killall SystemUIServer'
alias size_dir='du -hs'

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

# DB Aliases for mysql and postgres live in ~/.bash_osx and ~/.bash_linux