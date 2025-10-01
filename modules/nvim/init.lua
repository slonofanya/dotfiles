-- Load core functions first
require('functions')
require('common')

-- Load plugins (lazy.nvim will handle plugin loading)
require('plugins')

-- Load configurations after plugins
require('colorscheme')
require('lsp')
require('nvim-tree-config')
require('statusline-config')
require('telescope-config')
