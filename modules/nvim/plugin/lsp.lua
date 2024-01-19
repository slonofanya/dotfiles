local map = vim.keymap.set
local opts = { noremap=true, silent=true }

local lspconfig = require('lspconfig')
local goToPreview = require('goto-preview')

-- vim.diagnostic.config({signs=false})

map('n', '<leader>e', vim.diagnostic.open_float, opts)
map('n', '[d', vim.diagnostic.goto_prev, opts)
map('n', ']d', vim.diagnostic.goto_next, opts)
map('n', '<leader>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap=true, silent=true, buffer=bufnr }

  map('n', 'gD', vim.lsp.buf.declaration, bufopts)
  map('n', 'gv', ':vsp<cr>vim.lsp.buf.definition()<cr>', bufopts)
  map('n', 'gd', goToPreview.goto_preview_definition, bufopts)
  map('n', 'K', vim.lsp.buf.hover, bufopts)
  map('n', 'gi', vim.lsp.buf.implementation, bufopts)
  map('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  map('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  map('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  map('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  map('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  map('n', 'gr', vim.lsp.buf.references, bufopts)
  map('n', '<leader>f', function()
    vim.lsp.buf.format({ async=true })
  end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

lspconfig['tsserver'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
}

local cmp = require('cmp')
local lspkind = require('lspkind')

local source_mapping = {
  copilot = '[Co]',
  buffer = '[Buffer]',
  nvim_lsp = '[LSP]',
  nvim_lua = '[Lua]',
  -- cmp_tabnine = '[TN]',
  path = '[Path]',
}

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable,
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close()
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),

    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),

  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.symbolic(vim_item.kind, {mode = 'symbol'})
      vim_item.menu = source_mapping[entry.source.name]

      if entry.source.name == 'cmp_tabnine' then
        local detail = (entry.completion_item.labelDetails or {}).detail
        vim_item.kind = ''

        if detail and detail:find('.*%%.*') then
          vim_item.kind = vim_item.kind .. ' ' .. detail
        end

        if (entry.completion_item.data or {}).multiline then
          vim_item.kind = vim_item.kind .. ' ' .. '[ML]'
        end
      end

      local maxwidth = 80
      vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
      return vim_item
    end
  },

  sources = cmp.config.sources({
    { name = 'copilot' },
    { name = 'cmp_tabnine' },
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
    { name = 'rg' },
    { name = 'rg' },
  }),

  snippet = {
    expand = function(args)
      local luasnip = require('luasnip')

      if not luasnip then
        return
      end

      luasnip.lsp_expand(args.body)
    end,
  }
})

local tabnine = require('cmp_tabnine.config')
tabnine:setup({
  max_lines = 1000,
  max_num_results = 10,
  sort = true,
  run_on_every_keystroke = true,
  snippet_placeholder = '..',
})

require('nvim_comment').setup()

require('lsp-format').setup {
  typescript = {
    tab_width = function()
      return vim.opt.shiftwidth:get()
    end,
  },

  yaml = { tab_width = 2 },
  json = { tab_width = 2 },
}

local prettier = {
    formatCommand = [[prettier --stdin-filepath ${INPUT} ${--tab-width:tab_width}]],
    formatStdin = true,
}
require('lspconfig').efm.setup {
    on_attach = require('lsp-format').on_attach,
    init_options = { documentFormatting = true },
    settings = {
        languages = {
            typescript = { prettier },
            yaml = { prettier },
            json = { prettier },
        },
    },
}


local util = require 'lspconfig.util'

local root_files = {
  'pyproject.toml',
  'setup.py',
  'setup.cfg',
  'requirements.txt',
  'Pipfile',
  'pyrightconfig.json',
  '.git',
}

local function organize_imports()
  local params = {
    command = 'pyright.organizeimports',
    arguments = { vim.uri_from_bufnr(0) },
  }
  vim.lsp.buf.execute_command(params)
end

local function set_python_path(path)
  local clients = vim.lsp.get_active_clients {
    bufnr = vim.api.nvim_get_current_buf(),
    name = 'pyright',
  }
  for _, client in ipairs(clients) do
    client.config.settings = vim.tbl_deep_extend('force', client.config.settings, { python = { pythonPath = path } })
    client.notify('workspace/didChangeConfiguration', { settings = nil })
  end
end

return {
  default_config = {
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_dir = function(fname)
      return util.root_pattern(unpack(root_files))(fname)
    end,
    single_file_support = true,
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          diagnosticMode = 'openFilesOnly',
        },
      },
    },
  },
  commands = {
    PyrightOrganizeImports = {
      organize_imports,
      description = 'Organize Imports',
    },
    PyrightSetPythonPath = {
      set_python_path,
      description = 'Reconfigure pyright with the provided python path',
      nargs = 1,
      complete = 'file',
    },
  },
  docs = {
    description = [[
https://github.com/microsoft/pyright

`pyright`, a static type checker and language server for python
]],
  },
}
