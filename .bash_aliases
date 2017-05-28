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

# MAMP Bins
alias mysql="/Applications/MAMP/library/bin/mysql"

# directory jumping
alias up="cd .."
alias ..="cd .."

alias home="cd ~/"
alias sites="cd ~/Sites/"
alias downloads="cd ~/Downloads/"

# macvim shortcuts
alias mvim='open -a MacVim'

# list shortcuts
alias lsh='ls -d .*'
alias lstree='find . -type f'
alias tree="tree -C -I node_modules"

alias npmls='npm ls --only=prod --depth=0'

# echo $PATH
alias path='echo -e ${PATH//:/\\n}'

# Xcode
alias purgeallbuilds='rm -rf ~/Library/Developer/Xcode/DerivedData/*'

alias iPhone4s="ios-sim start --devicetypeid com.apple.CoreSimulator.SimDeviceType.iPhone-4s"
alias iPhone5s="ios-sim start --devicetypeid com.apple.CoreSimulator.SimDeviceType.iPhone-5"
alias iPhone6="ios-sim start --devicetypeid com.apple.CoreSimulator.SimDeviceType.iPhone-6"
alias iPhone6Plus="ios-sim start --devicetypeid com.apple.CoreSimulator.SimDeviceType.iPhone-6-Plus"
alias iPhoneSE="ios-sim start --devicetypeid com.apple.CoreSimulator.SimDeviceType.iPhone-SE"

alias iPadAir="ios-sim start --devicetypeid com.apple.CoreSimulator.SimDeviceType.iPad-Air"

# Android devices
alias nexus4="emulator -avd Nexus_4_API_16"
alias nexus5="emulator -avd Nexus_5_API_25"
alias nexusS="emulator -avd Nexus_S_API_25"

# Django¬
alias dj="python manage.py"
alias dm="python manage.py migrate"
alias dt="python manage.py test"

alias drs="python manage.py runserver"
alias dsh="python manage.py shell"
alias dsm="python manage.py schemamigration"
alias dms="python manage.py makemigrations"
alias ddd="python manage.py dumpdata"
alias dld="python manage.py loaddata"
