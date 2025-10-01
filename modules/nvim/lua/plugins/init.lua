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
  {
    'navarasu/onedark.nvim',
    lazy = false,
    priority = 1000,
  },
  
  {
    'nvim-lua/plenary.nvim',
    lazy = true,
  },

  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile" },
    keys = {
      { "<leader>N", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
      { "<leader>n", "<cmd>NvimTreeFindFile<cr>", desc = "Find file in NvimTree" },
    },
    config = function ()
    end,
  },

  {
    'lukas-reineke/cmp-rg',
    lazy = true,
  },
  {
    'neovim/nvim-lspconfig',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
    },
  },
  {
    'lukas-reineke/lsp-format.nvim',
    lazy = true,
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'Exafunction/codeium.vim',
    event = 'InsertEnter',
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'onsails/lspkind-nvim',
    },
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { "BufReadPost", "BufNewFile" },
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { 
          'lua', 'vim', 'vimdoc', 'query',
          'javascript', 'typescript', 'tsx', 'python',
          'json', 'yaml', 'html', 'css', 'markdown'
        },
        sync_install = false,
        auto_install = true,
        highlight = { 
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },  
      })
    end
  },

  {
    'rmagatti/goto-preview',
    event = { "BufReadPost" },
    config = function()
      require('goto-preview').setup {
        width = 120;
        height = 30;
        references = {
          telescope = require("telescope.themes").get_dropdown({ hide_preview = false })
        };
      }
    end
  },

  {
    'rmagatti/auto-session',
    lazy = false,
    config = function()
      require('auto-session').setup {
        log_level = 'error',
        auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/'},
      }
    end
  },

  {
    'terrortylor/nvim-comment',
    keys = {
      { 'gc', mode = { 'n', 'v' }, desc = 'Comment toggle' },
    },
    config = function()
      require('nvim_comment').setup()
    end,
  },

  {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.4',
    cmd = "Telescope",
    keys = {
      { '<C-f>', '<cmd>Telescope find_files<cr>', desc = 'Find files' },
      { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Live grep' },
      { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Buffers' },
    },
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  {
    'SuperBo/fugit2.nvim',
    opts = {},
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons',
      'nvim-lua/plenary.nvim',
      {
        'chrisgrieser/nvim-tinygit',
        dependencies = { 'stevearc/dressing.nvim' }
      },
    },
    cmd = { 'Fugit2', 'Fugit2Graph' },
    keys = {
      { '<leader>F', mode = 'n', '<cmd>Fugit2<cr>', desc = 'Open Fugit2' }
    }
  },

  {
    'sindrets/diffview.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = {
      'DiffviewFileHistory', 'DiffviewOpen', 'DiffviewToggleFiles', 'DiffviewFocusFiles', 'DiffviewRefresh'
    }
  },

  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  {
    'norcalli/nvim-colorizer.lua',
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("colorizer").setup()
    end
  },
}, {
  defaults = {
    lazy = true,
  },
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
