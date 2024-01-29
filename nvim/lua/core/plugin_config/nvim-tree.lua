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
    -- icons = {
    --   glyphs = {
    --     folder = {
    --       arrow_closed = "◯",
    --       arrow_open = "●",
    --     },
    --   },
    -- },
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
