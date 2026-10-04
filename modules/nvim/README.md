# nvim

Neovim config (Lua, plugin manager: [lazy.nvim](https://github.com/folke/lazy.nvim), bootstrapped automatically).
This is the only editor config in the repo.

- **Target:** `~/.config/nvim` -> `<repo>/modules/nvim` (symlink)
- **Requires:** Neovim >= 0.9, `git`, `ripgrep`, `node` (LSP servers/eslint/tsserver), a C compiler (treesitter), a Nerd Font
- **Env:** `EDITOR=nvim` is exported by [zsh](../zsh/README.md)

## Setup
```bash
sudo apt install -y neovim git ripgrep build-essential   # or install nvim >= 0.9 from GitHub releases
mkdir -p ~/.config
[ -e ~/.config/nvim ] && mv ~/.config/nvim ~/.config/nvim.bak
ln -s ~/install/dotfiles/modules/nvim ~/.config/nvim
nvim --headless "+Lazy! sync" +qa      # install plugins non-interactively
```

## Verify
```bash
nvim --headless "+checkhealth" +qa      # or open nvim and run :checkhealth
nvim --headless "+lua print(vim.fn.stdpath('config'))" +qa   # should print ~/.config/nvim
```

## Layout
| File | Purpose |
|---|---|
| `init.lua` | Entry point; requires the modules below in order |
| `lua/funtions.lua` | `map`/`nmap`/`imap` keymap helpers (filename spelling is intentional) |
| `lua/common.lua` | Options, leader keys, undo (`stdpath('state')/undo`), spell, langmap |
| `lua/plugins/init.lua` | lazy.nvim bootstrap + plugin list |
| `lua/colorscheme.lua` | onedark (darker) |
| `lua/lsp.lua` | LSP, nvim-cmp, null-ls, eslint/efm/tsserver |
| `lua/nvim-tree-config.lua`, `statusline-config.lua`, `telescope-config.lua` | file tree, lualine, telescope |
| `lazy-lock.json` | Pinned plugin versions (commit changes) |

## Notes
- Codeium (`Exafunction/codeium.vim`) needs `:Codeium Auth` once.
- Treesitter uses `ensure_installed = 'all'` — first launch is slow.
- Add a plugin: edit `lua/plugins/init.lua`, then `:Lazy sync`.
