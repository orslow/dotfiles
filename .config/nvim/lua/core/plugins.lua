local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

local plugins = {
  "christoomey/vim-system-copy",

  "nvim-tree/nvim-tree.lua",
  "kyazdani42/nvim-web-devicons",

  "hashivim/vim-terraform",

  -- "alexghergh/nvim-tmux-navigation",
  -- "christoomey/vim-tmux-navigator",
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-q>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-q>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-q>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-q>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-q>TmuxNavigatePrevious<cr>" },
    },
  },

  -- maximizes and restores current window (tmux "Z")
  "szw/vim-maximizer",

  "lewis6991/gitsigns.nvim",
  -- "FabijanZulj/blame.nvim",
  {
    "FabijanZulj/blame.nvim",
    config = function()
      require("blame").setup({
        date_format = "%Y-%m-%d",
      })
    end
  },

  -- highlighting
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

  -- fuzzy finding
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies = { {"nvim-lua/plenary.nvim"} }
  },

  -- managing & installing lsp servers, linters & formatters
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },

  -- lsp for scala
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
    }
  },

  -- autocompletion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip",
  -- "saadparwaiz1/cmp_luasnip",
  -- "rafamadriz/friendly-snippets",

  -- colorschemes
  "projekt0n/github-nvim-theme",
  -- "josebalius/vim-light-chromeclipse"
  -- "yasukotelin/shirotelin",
  -- "nelstrom/vim-mac-classic-theme",
  -- "romgrk/github-light.vim",
  -- "cormacrelf/vim-colors-github",

  -- configuring lsp servers
  -- "glepnir/lspsaga.nvim", branch = "main",

  -- formatting & linting
  -- "jose-elias-alvarez/null-ls.nvim",
  -- "jayp0521/mason-null-ls.nvim",

  -- comment with gc
  -- "numToStr/Comment.nvim",
}

local opts = {}

require("lazy").setup(plugins, opts)
