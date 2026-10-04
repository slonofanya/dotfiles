# alacritty

- **Target:** `~/.config/alacritty/alacritty.yml` <- `<repo>/modules/alacritty/.alacritty.yml`
- Font: SauceCodePro Nerd Font 18, `TERM=xterm-256color`, title `SL`. Install the Nerd Font (also needed by [nvim](../nvim/README.md) icons).
- Note: YAML config is for Alacritty < 0.13; newer versions use TOML (`alacritty migrate`).

## Setup
```bash
mkdir -p ~/.config/alacritty
ln -sf ~/install/dotfiles/modules/alacritty/.alacritty.yml ~/.config/alacritty/alacritty.yml
```
