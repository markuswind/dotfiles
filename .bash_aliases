# config
alias aliasconfig="vim ~/.bash_aliases"
alias zshconfig="vim ~/.zshrc"
alias sourcezsh="source ~/.zshrc"
alias szsh="source ~/.zshrc"
alias vimconfig="vim ~/.vimrc"

# notes

alias notes="vim +'normal Go' +'r!date' \$NOTES"

# general
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash"

# file/dir creation
alias mkdir="mkdir -pv"

# colorize the grep command output
alias grep='rg'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# network
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

alias openports='netstat -tulanp'

# directory jumping
alias up="cd .."
alias ..="cd .."

alias home="cd ~/"
alias back="cd -"

alias dotfiles="nametab DOTFILES && cd ~/dotfiles/" 
alias downloads="cd ~/Downloads/"
alias react="cd ~/ReactProjects/"

# list shortcuts
alias ls="ls -G -CF"
alias ll="ls -CFlhA"
alias lsh='ls -d .*'
alias lstree='find . -type f'
alias sl="ls" # typo
alias tree="tree -C -I node_modules"

# iterm tab naming + coloring
alias tabbuild="nametab BUILD && clear"
alias tabdebug="nametab DEBUG && clear"
alias tabgit="nametab GIT && clear"
alias tabnode="nametab NODE && clear"

# neovim
alias vim="nvim"
alias vi="nvim"

# echo $PATH
alias path='echo -e ${PATH//:/\\n}'

# xcode
alias purgeallbuilds='rm -rf ~/Library/Developer/Xcode/DerivedData/*'

alias iPhone5s="ios-sim start --devicetypeid iPhone-5s"
alias iPhone6="ios-sim start --devicetypeid iPhone-6"
alias iPhone6Plus="ios-sim start --devicetypeid iPhone-6-Plus"
alias iPhoneSE="ios-sim start --devicetypeid iPhone-SE"

alias iPad5th="ios-sim start --devicetypeid iPad--5th-generation-"
alias iPadAir="ios-sim start --devicetypeid iPad-Air"

# android devices
alias nexus4="emulator -avd Nexus_4_API_16"
alias nexus5="emulator -avd Nexus_5_API_25"
alias nexusS="emulator -avd Nexus_S_API_25"
alias pixelXL="emulator -avd Pixel_XL_API_26"

# npm shortcuts
alias npmstart="nametab NODE && clear && npm start --reset-cache"
alias npmglist="npm list -g --depth=0 2>/dev/null"
alias npmlist="npm list --depth=0 2>/dev/null"

# yarn shortcuts
alias yarnstart="nametab NODE && clear && yarn && yarn start"

# android debugging
alias pidcat="nametab DEBUG && clear && pidcat --clear --current"

# react native shortcuts
alias rnra="react-native run-android"
alias rnla="nametab DEBUG && clear && pidcat --clear --current -t ReactNativeJS"
alias rnba="react-native bundle --dev false --platform android --entry-file index.android.js --bundle-output ./android/app/build/intermediates/assets/debug/index.android.bundle --assets-dest ./android/app/build/intermediates/res/merged/debug --sourcemap-output ./android/app/build/sourcemap.js"
alias rngba="cd android && ./gradlew assembleRelease && cd .."

alias rnri="react-native run-ios | xcpretty"
alias rnli="nametab DEBUG && clear && react-native log-ios"
alias rnbi="react-native bundle --platform ios --entry-file index.ios.js --dev false --bundle-output ./ios/main.jsbundle --assets-dest ./ios --sourcemap-output ./ios/sourcemap.js"

# django
alias djangorun="python manage.py runserver"
alias djangomigrate="python manage.py migrate"
alias djangotest="python manage.py test"

# love game engine (love2d.org)
alias love="/Applications/love.app/Contents/MacOS/love"
