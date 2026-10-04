# tmux

- **Target:** `~/.tmux.conf` -> `<repo>/modules/tmux/.tmux.conf`
- Prefix `C-a`; `|` / `-` split; `h j k l` pane nav; vi mode keys; default shell zsh ([zsh](../zsh/README.md)).
- Plugins via TPM: resurrect (nvim session strategy, see [nvim](../nvim/README.md)), sessionist, cowboy, df, yank. `tmux-continuum` options are set but it is not in the plugin list.

## Setup
```bash
sudo apt install -y tmux git          # distro tmux is fine; building from source is optional
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/drmad/tmux-git.git ~/.tmux-git
ln -sf ~/install/dotfiles/modules/tmux/.tmux.conf ~/.tmux.conf
tmux new -d -s setup && ~/.tmux/plugins/tpm/bin/install_plugins   # non-interactive plugin install
```
Interactive alternative: start tmux, press `C-a` then `I`.

## Verify
`tmux source-file ~/.tmux.conf && tmux show -g prefix` -> `prefix C-a`
