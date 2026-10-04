# zsh

zsh + oh-my-zsh (theme `ys`), z, fzf, navi, autosuggestions, syntax highlighting.

- **Target:** `~/.zshrc` -> `<repo>/modules/zsh/.zshrc`
- **Files:** `.zshrc` (config), `install.sh` (installs oh-my-zsh, plugins, fzf, z), `zprezto.sh` (alternative prezto runcom linking, optional)
- Sets `EDITOR=nvim` ([nvim](../nvim/README.md)), adds `tools/` and `~/.cargo/bin` to `PATH`, aliases `ta='tmux a'`.

## Setup
```bash
sudo apt install -y zsh git curl ripgrep
ln -sf ~/install/dotfiles/modules/zsh/.zshrc ~/.zshrc   # back up an existing ~/.zshrc first
bash ~/install/dotfiles/modules/zsh/install.sh          # interactive: oh-my-zsh may start a new shell; re-run if interrupted
chsh -s "$(which zsh)"                                  # then log out / in
```
Note: the oh-my-zsh installer may overwrite `~/.zshrc`; re-run the `ln -sf` afterwards.

## Verify
```bash
zsh -ic 'echo $EDITOR; command -v fzf z'
```

## Notes
- `.zshrc` contains machine-specific paths (`/home/sl/...`, nvm, deno); adjust for a new user.
- nvm is installed separately: `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash && nvm install stable`
