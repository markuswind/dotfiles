# Path to your oh-my-zsh installation.
export ZSH=/Users/markus/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bullet-train"

# zsh-syntax-hightlighting (brew install)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# tmux stuff
# if [[ $TMUX ]]; then
#	
# fi

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git)

# User configuration
export PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/Users/markus/bin/:/Users/markus/Library/Android/sdk/tools:/Users/markus/Library/Android/sdk/platform-tools:/usr/local/mysql/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Virtualenv wrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/DjangoProjects
source /usr/local/bin/virtualenvwrapper.sh

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

# servers
alias mysql="/Applications/MAMP/Library/bin/mysql"
alias startftp="sudo -s launchctl load -w /System/Library/LaunchDaemons/ftp.plist"
alias stopftp="sudo -s launchctl unload -w /System/Library/LaunchDaemons/ftp.plist"

# Shortcuts to paths
alias home="cd ~/"
alias sites="cd /Applications/MAMP/htdocs"
alias downloads="cd ~/Downloads/"

# list shortcuts
alias lsh='ls -d .*'
alias lstree='find . -type f'

# directory jumping
alias path='echo -e ${PATH//:/\\n}'
alias up="cd .."
alias ..="cd .."

# Xcode
alias iPhone4s="ios-sim start --devicetypeid com.apple.CoreSimulator.SimDeviceType.iPhone-4s"  
alias iPhone5s="ios-sim start --devicetypeid com.apple.CoreSimulator.SimDeviceType.iPhone-5"  
alias iPadAir="ios-sim start --devicetypeid com.apple.CoreSimulator.SimDeviceType.iPad-Air"  
alias iPhone6Plus="ios-sim start --devicetypeid com.apple.CoreSimulator.SimDeviceType.iPhone-6-Plus"  
alias iPhone6="ios-sim start --devicetypeid com.apple.CoreSimulator.SimDeviceType.iPhone-6"

# Django
alias dj="python manage.py"
alias drs="python manage.py runserver"
alias dsh="python manage.py shell"
alias dsm="python manage.py schemamigration"
alias dms="python manage.py makemigrations"
alias dm="python manage.py migrate"
alias ddd="python manage.py dumpdata"
alias dld="python manage.py loaddata"
alias dt="python manage.py test"
