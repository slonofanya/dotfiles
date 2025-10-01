local ok, telescope = pcall(require, 'telescope')
if not ok then
  return
end

-- Configure telescope
telescope.setup({
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = { "node_modules", ".git/", "dist/", "build/" },
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
      },
    },
  },
  pickers = {
    find_files = {
      hidden = false,
    },
  },
})

-- Keymaps are now defined in plugins/init.lua for lazy loading
