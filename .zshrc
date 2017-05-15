# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="dstufft"

# load oh-my-zsh if installed
if [ -f $ZSH/oh-my-zsh.sh ]; then
  source $ZSH/oh-my-zsh.sh
else
  echo 'oh-my-zsh is not installed (check: https://github.com/robbyrussell/oh-my-zsh for instructions)'
fi

# enable base16 shell (https://github.com/chriskempson/base16-shell)
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# zsh-syntax-highlighting
if [ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
  echo "zsh-syntax-highlighting is not installed (check: https://github.com/zsh-users/zsh-syntax-highlighting for instructions)"
fi

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git)

# User configuration
export ANDROID_HOME="/usr/local/Cellar/android-sdk/24.4.1_1"
export PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:$HOME/dotfiles/bin"
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"
export MANPATH="/usr/local/man:$MANPATH"
export NVM_DIR="$HOME/.nvm"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_CTYPE="utf-8"

# use brew vim if present
/usr/local/bin/vim --version > /dev/null 2>&1
BREW_VIM_INSTALLED=$?
if [ $BREW_VIM_INSTALLED -eq 0 ]; then
  alias vi="/usr/local/bin/vim"
fi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"

# Virtualenv wrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/DjangoProjects

# Source git-completion
if [ -f $HOME/dotfiles/.bin/git-completion.bash ]; then
  source $HOME/dotfiles/.bin/git-completion.bash
fi

# Source django-completion
if [ -f $HOME/dotfiles/.bin/django_bash_completion ]; then
  . $HOME/dotfiles/.bin/django_baash_completion
fi

# Source aliases
if [ -f $HOME/.bash_aliases ]; then
  source $HOME/.bash_aliases
fi

# iTerm2 tab naming
DISABLE_AUTO_TITLE="true"

function nametab() {
  echo -ne "\033]0;$1\007"
}
export PATH="/usr/local/bin:$PATH"
