local global_opt = vim.opt_global

-- general
vim.opt.startofline = true
vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.autoread = true

-- line numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- tabs / indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.autoindent = true

-- line wrapping
vim.opt.wrap = false

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- cursor
vim.opt.cursorline = true
vim.opt.scrolloff = 5

-- appearance
vim.opt.termguicolors = true
vim.opt.background = "light"
vim.opt.signcolumn = "yes"

-- backspace
vim.opt.backspace = "indent,eol,start"

-- clipboard
-- vim.opt.clipboard:append("unnamedplus")

-- mouse
vim.opt.mouse = "r"

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- vim.opt.iskeyword:append("-") -- "-" as part of word

vim.g.terraform_fmt_on_save = 1

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

global_opt.showmatch = true
-- global_opt.wildignore = { ".git", "*/node_modules/*", "*/target/*", ".metals", ".bloop", ".ammonite", }
