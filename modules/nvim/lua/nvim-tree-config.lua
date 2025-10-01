-- Disable netrw (recommended by nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Only setup if nvim-tree is loaded
local ok, nvim_tree = pcall(require, 'nvim-tree')
if not ok then
  return
end

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

-- Removed auto-open on BufEnter for better performance
-- Users can manually open with <Leader>N or <Leader>n

nvim_tree.setup({
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
