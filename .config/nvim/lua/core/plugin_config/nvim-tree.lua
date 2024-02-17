-- local setup, nvimtree = pcall(require, "nvim-tree")
-- if not setup then
--     return
-- end

-- recommended settings from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')

require("nvim-tree").setup({
  renderer = {
    full_name = true,
    indent_markers = {
      enable = false,
    },
    icons = {
      -- git_placement = "signcolumn",
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
      resize_window = false,
      window_picker = {
        enable = false,
      },
    },
  },
  view = {
    width = "15%",
    side = "left",
    -- preserve_window_proportions = false,
  },
})
