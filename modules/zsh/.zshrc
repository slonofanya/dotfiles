#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
#if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
#fi
export ZSH=/home/sl/.oh-my-zsh
ZSH_THEME="rubbyrussel"
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#
## Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
#source ~/.rvm/scripts/rvm

export NVM_DIR="$HOME/.nvm"
if ([ -s "$NVM_DIR/nvm.sh" ]) then
  \. "$NVM_DIR/nvm.sh"  # This loads nvm

  # place this after nvm initialization!
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
fi

export CLICOLOR=1
export EDITOR='rvim'
export TERM="screen-256color"

export PATH="$PATH:$HOME/app"
export PATH="$PATH:$HOME/app/firefox"

# alias tmux="tmux -2"
# alias ta="tmux attach-session"

export PATH="$HOME/install/dotfiles/tools/ripgrep-0.6.0-x86_64-unknown-linux-musl/:$PATH"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'





