# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="wind" # Load custom zsh
ENABLE_CORRECTION="true"

# Load oh-my-zsh if installed
if [ -f $ZSH/oh-my-zsh.sh ]; then
  source $ZSH/oh-my-zsh.sh
else
  echo 'oh-my-zsh is not installed (check: https://github.com/robbyrussell/oh-my-zsh for instructions)'
fi

# Load zsh-syntax-highlighting
if [ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
  echo "zsh-syntax-highlighting is not installed (check: https://github.com/zsh-users/zsh-syntax-highlighting for instructions)"
fi

# Add auto ls after cd. Only in response to a user-initiated `cd`, ..
# .. not indirectly (eg. via another function).
function auto-ls-after-cd() {
  emulate -L zsh

  if [ "$ZSH_EVAL_CONTEXT" = "toplevel:shfunc" ]; then
    ls
  fi
}

add-zsh-hook chpwd auto-ls-after-cd

# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git)

# User configuration
export ANDROID_HOME="/usr/local/Cellar/android-sdk/24.4.1_1"

export PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:$HOME/dotfiles/bin"
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH"
export PATH="/usr/local/mysql/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

export MANPATH="/usr/local/man:$MANPATH"
export WRITE_GOOD_GIT_ALLOW=1

# Shortcuts
export NOTES="$HOME/Documents/notes.md"
export GOALS="$HOME/Documents/goals.md"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_CTYPE="utf-8"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# SSH
export SSH_KEY_PATH="~/.ssh/dsa_id"

# Setup base16 shell (https://github.com/chriskempson/base16-shell)
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Source colors
if [ -f $HOME/dotfiles/bin/colors ]; then
  source $HOME/dotfiles/bin/colors
  autoload -U colors
  colors
fi

# Source git-completion
if [ -f $HOME/dotfiles/.bin/git-completion.bash ]; then
  source $HOME/dotfiles/.bin/git-completion.bash
fi

# Source aliases
if [ -f $HOME/.bash_aliases ]; then
  source $HOME/.bash_aliases
fi

# Source iterm2 helpers
if [ -f $HOME/dotfiles/.itermhelpers ]; then
  source $HOME/dotfiles/.itermhelpers
fi

# NVM, see: https://github.com/creationix/nvm#install-script
export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
