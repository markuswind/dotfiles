# config
alias aliasconfig="vim ~/.bash_aliases"
alias zshconfig="vim ~/.zshrc"
alias sourcezsh="source ~/.zshrc"
alias vimconfig="vim ~/.vimrc"

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
alias dotfiles="nametab DOTFILES && colortab grey && clear && cd ~/dotfiles/" 
alias downloads="cd ~/Downloads/"
alias react="cd ~/ReactProjects/"
alias work="cd ~/ReactProjects/simplicate-native/"
alias selectinput="cd ~/ReactProjects/react-native-select-input-ios/"

# list shortcuts
alias ls="ls -CF"
alias ll="ls -CFlhA"
alias lsh='ls -d .*'
alias lstree='find . -type f'
alias sl="ls" # typo
alias tree="tree -C -I node_modules"

# iterm tab naming + coloring
alias tabbuild="nametab BUILD && colortab blue && clear"
alias tabdebug="nametab DEBUG && colortab purple && clear"
alias tabgit="nametab GIT && colortab red && clear"
alias tabnode="nametab NODE && colortab orange && clear"

# (brew)vi(m)
# alias vim="/usr/local/Cellar/vim/8.0.0666_1/bin/vim"
alias vim="vi"

# macvim
alias mvim='open -a MacVim'

# echo $PATH
alias path='echo -e ${PATH//:/\\n}'

# Xcode
alias purgeallbuilds='rm -rf ~/Library/Developer/Xcode/DerivedData/*'

alias iPhone4s="ios-sim start --devicetypeid com.apple.CoreSimulator.SimDeviceType.iPhone-4s"
alias iPhone5s="ios-sim start --devicetypeid com.apple.CoreSimulator.SimDeviceType.iPhone-5"
alias iPhone6="ios-sim start --devicetypeid com.apple.CoreSimulator.SimDeviceType.iPhone-6"
alias iPhone6Plus="ios-sim start --devicetypeid com.apple.CoreSimulator.SimDeviceType.iPhone-6-Plus"
alias iPhoneSE="ios-sim start --devicetypeid com.apple.CoreSimulator.SimDeviceType.iPhone-SE"

alias iPad5th="ios-sim start --devicetypeid com.apple.CoreSimulator.SimDeviceType.iPad--5th-generation-"
alias iPadAir="ios-sim start --devicetypeid com.apple.CoreSimulator.SimDeviceType.iPad-Air"

# Android devices
alias nexus4="emulator -avd Nexus_4_API_16"
alias nexus5="emulator -avd Nexus_5_API_25"
alias nexusS="emulator -avd Nexus_S_API_25"
alias pixelXL="emulator -avd Pixel_XL_API_26"

# npm shortcuts
alias npmstart="nametab NODE && colortab orange && clear && npm start --reset-cache"
alias npmglist="npm list -g --depth=0 2>/dev/null"
alias npmlist="npm list --depth=0 2>/dev/null"

# android debugging
alias pidcat="nametab DEBUG && colortab purple && clear && pidcat --clear --current"

# react native shortcuts
alias rnra="react-native run-android"
alias rnla="nametab DEBUG && colortab purple && clear && pidcat --clear --current -t ReactNativeJS"
alias rnba="react-native bundle --dev false --platform android --entry-file index.android.js --bundle-output ./android/app/build/intermediates/assets/debug/index.android.bundle --assets-dest ./android/app/build/intermediates/res/merged/debug"
alias rngba="cd android && ./gradlew assembleRelease && cd .."

alias rnri="react-native run-ios | xcpretty"
alias rnli="nametab DEBUG && colortab purple && clear && react-native log-ios"
alias rnbi="react-native bundle --platform ios --entry-file index.ios.js --dev false --bundle-output ./ios/main.jsbundle --assets-dest ./ios --sourcemap-output ./ios/sourcemap.js"
