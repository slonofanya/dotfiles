vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

nmap('<Leader>N', ':NvimTreeToggle<CR>')
nmap('<Leader>n', ':NvimTreeFindFile<CR>')

local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return {
      desc = 'nvim-tree: ' .. desc,
      buffer = bufnr,
      noremap = true,
      silent = true,
      nowait = true
    }
  end

  api.config.mappings.default_on_attach(bufnr)

  local mappings = {
    ["s"] = { api.node.open.vertical, "Open: Vertical Split" },
  }

  for keys, mapping in pairs(mappings) do
    vim.keymap.set("n", keys, mapping[1], opts(mapping[2]))
  end
end

vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  pattern = 'NvimTree*',
  callback = function()
    local api = require('nvim-tree.api')
    -- local view = require('nvim-tree.view')

    -- if not view.is_visible() then
    if not api.tree.is_visible() then
      api.tree.open()
    end
  end,
})

require("nvim-tree").setup({
  on_attach = on_attach,
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
  },
  renderer = {
    -- group_empty = true,
  },
  filters = {
    -- dotfiles = true,
  },
  update_focused_file = {
    enable = true,
    update_root = true
  },
})
