# Bin aliases
alias zshconfig="nvim ~/.zshrc"
alias sourcezsh="source ~/.zshrc"
alias tmuxconfig="nvim ~/.tmux.conf"
alias sourcetmux="tmux source ~/.tmux.conf"

# Empty the Trash on all mounted volumes and the main HDD
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# servers¬
alias mysql="/Applications/MAMP/Library/bin/mysql"¬
alias startftp="sudo -s launchctl load -w /System/Library/LaunchDaemons/ftp.plist"
alias stopftp="sudo -s launchctl unload -w /System/Library/LaunchDaemons/ftp.plist"

# shortcuts to paths
alias home="cd ~/"
alias sites="cd /Applications/MAMP/htdocs"
alias downloads="cd ~/Downloads/"

# list shortcuts
alias lsh='ls -d .*'
alias lstree='find . -type f'

# directory jumping¬
alias path='echo -e ${PATH//:/\\n}'
alias up="cd .."
alias ..="cd .."

# Xcode
alias iPhone4s="ios-sim start --devicetypeid com.apple.CoreSimulator.SimDeviceType.iPhone-4s"
alias iPhone5s="ios-sim start --devicetypeid com.apple.CoreSimulator.SimDeviceType.iPhone-5"
alias iPadAir="ios-sim start --devicetypeid com.apple.CoreSimulator.SimDeviceType.iPad-Air"
alias iPhone6Plus="ios-sim start --devicetypeid com.apple.CoreSimulator.SimDeviceType.iPhone-6-Plus"
alias iPhone6="ios-sim start --devicetypeid com.apple.CoreSimulator.SimDeviceType.iPhone-6"

# Django¬
alias dj="python manage.py"
alias drs="python manage.py runserver"
alias dsh="python manage.py shell"
alias dsm="python manage.py schemamigration"
alias dms="python manage.py makemigrations"
alias dm="python manage.py migrate"
alias ddd="python manage.py dumpdata"
alias dld="python manage.py loaddata"
alias dt="python manage.py test"
