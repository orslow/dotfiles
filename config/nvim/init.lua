vim.g.mapleader = ' '
vim.opt.startofline = true
vim.opt.backspace = '2'
-- vim.opt.showcmd = true
-- vim.opt.laststatus = 2
-- vim.opt.autowrite = true
-- vim.opt.autoread = true

-- vim.opt.iskeyword:append("-") -- "-" as part of word

vim.opt.wrap = false

vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.showmatch = true

-- vim.opt.wildignore = { ".git", "*/target/*", ".metals", ".bloop", }

vim.opt.shiftwidth = 2
-- vim.opt.tabstop = 2
-- vim.opt.shiftround = true
-- vim.opt.expandtab = true
-- vim.opt.autoindent = true

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- cursor
vim.opt.cursorline = true
vim.opt.scrolloff = 4

-- appearance
vim.opt.termguicolors = true
vim.opt.background = "light"
vim.opt.signcolumn = "yes"

-- vim.opt.backspace = "indent,eol,start"

-- clipboard
-- vim.opt.clipboard:append("unnamedplus")

-- mouse
vim.opt.mouse = "r"

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "christoomey/vim-system-copy",

  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },

  -- "hashivim/vim-terraform", -- will be replaced by lsp?

  -- tmux "z"
  "szw/vim-maximizer",

  "lewis6991/gitsigns.nvim",
  "FabijanZulj/blame.nvim",

  -- highlighting
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

  -- colors
  "projekt0n/github-nvim-theme",
  -- "josebalius/vim-light-chromeclipse"
  -- "yasukotelin/shirotelin",
  -- "nelstrom/vim-mac-classic-theme",
  -- "romgrk/github-light.vim",
  -- "cormacrelf/vim-colors-github",


})

require('plugins')
