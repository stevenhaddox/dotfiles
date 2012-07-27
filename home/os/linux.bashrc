## -----------------------------------------------------
## SERVER - /ETC/BASH.BASHRC (UBUNTU/DEBIAN)
## Go ahead and use this for your servers 
## - Kris Khaira (www.KedaiRuncit.org)
## -----------------------------------------------------
export HISTCONTROL=erasedups
export EDITOR=vim

## UBUNTU/DEBIAN ONLY ##
LOGS=/var/log
alias sep='echo "---"'
alias e='vi ~/devkit/' #works nice with NERD Tree
alias r='source /etc/profile; source ~/.profile; source ~/.bashrc'
alias eh='sudo vi /etc/hosts'
alias nx.stop='sudo /etc/init.d/nginx stop'
alias nx.start='sudo /etc/init.d/nginx start'
alias ap.rs='sudo /etc/init.d/apache2 restart'
alias ap.rl='sudo /etc/init.d/apache2 reload'
alias ap.0='sudo /etc/init.d/apache2 stop'
alias ap.1='sudo /etc/init.d/apache2 start'
alias ap.log='tail -f /var/log/apache2/error.log'

# A/V
alias loop='mplayer -loop 0 -volume 10' #Plays an audio/video file with loop

# Communications
alias mail.log='tail -f /var/log/mail.log'
alias ir='irssi'
alias wee='weechat-curses'

# apt-get
alias apt='apt-get install'
alias remove='apt-get remove'
alias search='apt-cache search'

# MySQL
alias my.0='/etc/init.d/mysql stop'
alias my.1='/etc/init.d/mysql start'
alias my.r='/etc/init.d/mysql restart'

## Bash helpers ##
alias '...'='cd ../../../'
alias '..'='cd ../../'
alias h='history'
alias c='clear'
alias untar='tar zxvf'
alias flush='sudo /etc/init.d/networking restart'
alias i='sep; ifconfig; sep;'
alias archive.w='wget -k -m -r'
alias archive.c='wget -k -m -r'
alias dl='curl -C - -O'
alias dict='curl dict://dict.org/d:'
alias showpublickey='cat ~/.ssh/id_rsa.pub'
alias pastepublickey='mkdir ~/.ssh; chmod 700 ~/.ssh; cd ~/.ssh; touch authorized_keys; chmod 600 authorized_keys; vi authorized_keys'
alias ssh.ls='cd ~/.ssh/; ls -alF'
alias noexe='sudo rm -f *.exe' #Removes all *.exe files in a folder. Good for removing viruses from thumbdrives.
alias phpinfo='echo "<?php phpinfo(); ?>" | sudo tee -a info.php'
alias xx='echo; echo "-------------------------------------------------------------------"; echo'
alias 755folders="find . ./ -type d -exec chmod 755 {} \;"
alias 644files="find . ./ -type f -exec chmod 644 {} \;"
alias 777folders="find . ./ -type d -exec chmod 777 {} \;"
alias conn='netstat -nl | grep tcp4' #Active connections
alias v='vim'
alias v.='vim .'
alias sv='sudo vim'
alias ev='vim ~/.vimrc'
alias em='emacs'
alias ah='alias -p | ack -C ' #alias help

## Git ##
alias gs='git status'
alias gp='git push -v'
alias gpo='git push -v origin' #push to origin all branches
alias gpom='git push -v origin master' #push to origin the master branch
alias ga='git add'
alias gu='git pull'
alias gu.pm='git pull projectlocker master'
alias gu.um='git pull unfuddle master'
alias gl='git log'
alias gl1='echo "#---"; git log --pretty=oneline; echo "#---";'
alias grm='git status | grep deleted | awk '\''{print $3}'\'' | xargs git rm' #git rm all deleted files
alias gc='git commit -m'
alias gi='vi .gitignore'
alias gd='git diff | mate'

alias gb='git branch'
alias gba='git branch -a'
alias gsh='git show'
alias gn='nub'
alias gco='git checkout'
alias gg='git gui'

## Subversion ##
export SVN_EDITOR=vi
alias sup='echo ""; date; svn update; echo ""'
alias sexternal='svn propedit svn:externals .'
alias sl='svn log --limit'
alias slist='svn list'
alias ss='svn status'
alias sq='svn status -q'
alias scl='svn cleanup'
alias sm='svn move'
alias sc='svn commit -m'
alias scc='svn commit'
alias sa='svn add'
alias sx='svn delete'
alias sr='svn revert'
alias si='svn propset svn:ignore'
alias si.r='svn propset -R svn:ignore'
alias svnclear='find . -name .svn -print0 | xargs -0 rm -rf' #removes all .svn files. use with caution.
alias sudosvnclear='sudo find . -name .svn -print0 | xargs -0 sudo rm -rf' #removes all .svn files. use with caution.
alias sa*='svn status | grep "^\?" | awk "{print \$2}" | xargs svn add' # adds all unadded files
alias sx*='svn status | grep "^\!" | awk "{print \$2}" | xargs svn delete' # deletes all absent files


## Rails ##
alias r.dm='bundle exec rake db:migrate'
alias r.dfl='bundle exec rake db:fixtures:load'
alias r.s='bundle exec rails server'
alias rg.i='bundle update'
