#!/usr/bin/env bash
# Usage: ./install.sh [module ...]   (default: zsh nvim tmux)
# Modules with simple symlink setup: zsh nvim tmux alacritty elinks
# Existing targets are moved to <target>.bak. Package installs need sudo (apt).
set -euo pipefail
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODS=("$@"); [ $# -eq 0 ] && MODS=(zsh nvim tmux)

link() { # link <src> <dst>
  mkdir -p "$(dirname "$2")"
  if [ -e "$2" ] || [ -L "$2" ]; then
    [ "$(readlink "$2")" = "$1" ] && return 0
    mv "$2" "$2.bak"
  fi
  ln -s "$1" "$2"; echo "linked $2 -> $1"
}

for m in "${MODS[@]}"; do
  case "$m" in
    zsh)       sudo apt-get install -y zsh git curl ripgrep; link "$REPO/modules/zsh/.zshrc" ~/.zshrc ;;
    nvim)      sudo apt-get install -y neovim git ripgrep build-essential
               link "$REPO/modules/nvim" ~/.config/nvim
               nvim --headless "+Lazy! sync" +qa ;;
    tmux)      sudo apt-get install -y tmux git
               [ -d ~/.tmux/plugins/tpm ] || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
               link "$REPO/modules/tmux/.tmux.conf" ~/.tmux.conf ;;
    alacritty) link "$REPO/modules/alacritty/.alacritty.yml" ~/.config/alacritty/alacritty.yml ;;
    elinks)    sudo apt-get install -y elinks; link "$REPO/modules/elinks/elinks.conf" ~/.elinks/elinks.conf ;;
    *) echo "unknown or manual module: $m (see modules/$m/README.md)" >&2; exit 1 ;;
  esac
done
