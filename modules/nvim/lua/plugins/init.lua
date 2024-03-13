local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
  'navarasu/onedark.nvim',

  'nvim-lua/plenary.nvim',

  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    event = { "VeryLazy" },
    config = function ()
    end,
  },

  'lukas-reineke/cmp-rg',

  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'lukas-reineke/lsp-format.nvim',
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter'
  },
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/nvim-cmp',
  'onsails/lspkind-nvim',

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('plugins.treesitter')
    end,

    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = 'all',
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },  
      })
    end
  },

  {
    'rmagatti/goto-preview',
    config = function()
      require('goto-preview').setup {}
    end
  },

  {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup {
        log_level = 'error',
        auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/'},
      }
    end
  },

  'terrortylor/nvim-comment',

  {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  {
    'tanvirtin/vgit.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },

  {
    'nvim-lualine/lualine.nvim',
  },

  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require("colorizer").setup()
    end
  },
})
