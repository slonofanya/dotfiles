# dotfiles

Personal Ubuntu dev environment: **neovim** (the only editor; vim was removed), zsh, tmux, alacritty, elinks, plus docker/ansible helpers.

## Quick start (humans and LLM agents)

> **For an LLM agent given this repo URL:** clone it, run `install.sh` for the modules the user wants, then run each module's *Verify* step. Do not edit files outside `~/` and the repo. Ask before running anything needing `sudo` that is not listed below. Per-module details are in each linked README.

```bash
sudo apt update && sudo apt install -y git curl
git clone https://github.com/slonofanya/dotfiles.git ~/install/dotfiles
cd ~/install/dotfiles
./install.sh                 # default: zsh nvim tmux
./install.sh nvim alacritty  # or pick modules
```
`install.sh` symlinks configs into `$HOME` (existing files are backed up as `*.bak`) and installs apt packages.

- **Prerequisites:** Ubuntu, `sudo`, network access. Repo location is expected at `~/install/dotfiles` (paths in `.zshrc` and `ansible.cfg` assume it).
- **No submodules** are needed any more; plain `git clone` is enough.

## Modules

| Module | What | Setup | Auto in `install.sh` |
|---|---|---|---|
| [nvim](modules/nvim/README.md) | Neovim (Lua, lazy.nvim, LSP, telescope, treesitter) | symlink to `~/.config/nvim` | yes |
| [zsh](modules/zsh/README.md) | zsh, oh-my-zsh, fzf, z, aliases | symlink `~/.zshrc` + `install.sh` | symlink only (run `modules/zsh/install.sh` for oh-my-zsh) |
| [tmux](modules/tmux/README.md) | tmux config + TPM plugins | symlink `~/.tmux.conf` | yes |
| [alacritty](modules/alacritty/README.md) | Terminal config | symlink | yes |
| [elinks](modules/elinks/README.md) | Text browser, vim-like keys | symlink | yes |
| [docker](modules/docker/README.md) | nginx + certbot static site | docker compose | no |
| [ansible](modules/ansible/README.md) | Installs Docker CE | ansible-playbook | no |
| [chrome-driver](modules/chrome-driver/README.md) | Chrome + ChromeDriver + Selenium (legacy) | script | no |

`tools/` holds helper binaries/scripts added to `PATH` by `.zshrc` (ripgrep 0.6.0, `frg`). Prefer `sudo apt install ripgrep`.

## Other tools
```bash
# nvm / node (needed by nvim LSPs)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash && nvm install stable
# rust
curl https://sh.rustup.rs -sSf | sh
# fastmod (find & replace by pattern): https://github.com/facebookincubator/fastmod
```

## Docker test image
`Dockerfile` builds a minimal container with zsh + neovim from this repo: `docker build -t dotfiles . && docker run -it dotfiles zsh`.
