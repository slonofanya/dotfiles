vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nmap('<Leader>N', ':NvimTreeToggle<CR>')
nmap('<Leader>n', ':NvimTreeFindFile<CR>')

return require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "p", action = "parent_node" },
        { key = "s", action = "vsplit" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    -- dotfiles = true,
  },
  update_focused_file = {
    enable = true,
    update_root = true
  },
})
