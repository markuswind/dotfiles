# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="bullet-train"

# load oh-my-zsh if installed
if [ -f $ZSH/oh-my-zsh.sh ]; then
  source $ZSH/oh-my-zsh.sh
else
  echo 'oh-my-zsh is not installed (check: https://github.com/robbyrussell/oh-my-zsh for instructions)'
fi

# zsh-syntax-hightlighting
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
export PATH="/bin:/usr/bin:/usr/sbin:/usr/local/bin:$HOME/dotfiles/bin"
export MANPATH="/usr/local/man:$MANPATH"

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
