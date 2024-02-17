-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')

require("nvim-tree").setup({
  hijack_cursor = true,
  sync_root_with_cwd = true,
  renderer = {
    full_name = true,
    indent_markers = {
      enable = false,
    },
    icons = {
      git_placement = "signcolumn",
      show = {
        file = true,
        folder = false,
        folder_arrow = true,
        git = true,
      }
    },
  },
  actions = {
    open_file = {
      resize_window = true,
      window_picker = {
        enable = false,
      },
    },
  },
  view = {
    -- adaptive_size = true,
    width = "15%",
    side = "left",
  },
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
})
