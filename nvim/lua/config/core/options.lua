local opt = vim.opt

-- general
opt.startofline = true

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs / indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor
opt.cursorline = true
opt.scrolloff = 5

-- appearance
opt.termguicolors = true
opt.background = "light"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
-- opt.clipboard:append("unnamedplus")

-- mouse
opt.mouse = "r"

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-") -- "-" as part of word

vim.g.terraform_fmt_on_save = 1
