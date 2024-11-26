require('plugins.nvim-tree')
require('plugins.colorscheme')
require('plugins.telescope')
require('plugins.lsp')
require('plugins.autocomplete')
require('plugins.nvim-treesitter')

--- general keymap/configs

vim.keymap.set("n", "<leader>z", ":MaximizerToggle<CR>")

vim.g.terraform_fmt_on_save = 1

vim.keymap.set('n', '<Leader>bl', ':BlameToggle<CR>', {})
