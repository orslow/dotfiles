local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer() -- true if packer was just installed

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use "christoomey/vim-system-copy"
    use "hashivim/vim-terraform"
    use 'christoomey/vim-tmux-navigator'
    use "szw/vim-maximizer" -- maximizes and restores current window (tmux 'Z')
    use "lewis6991/gitsigns.nvim"
    use 'tpope/vim-surround'

    -- file explorer
    use "nvim-tree/nvim-tree.lua"

    -- highlighting
    use "nvim-treesitter/nvim-treesitter"

    -- fuzzy finding
    -- use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- managing & installing lsp servers, linters & formatters
    use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    }

    -- lsp for scala
    use {
      'scalameta/nvim-metals',
      requires = {
        "nvim-lua/plenary.nvim",
        "mfussenegger/nvim-dap",
      }
    }

    -- autocompletion
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use 'L3MON4D3/LuaSnip'
    -- use 'saadparwaiz1/cmp_luasnip'
    -- use 'rafamadriz/friendly-snippets'

    -- colorschemes
    -- use 'yasukotelin/shirotelin'
    -- use 'nelstrom/vim-mac-classic-theme'
    -- use 'romgrk/github-light.vim'
    -- use 'cormacrelf/vim-colors-github'
    -- use 'josebalius/vim-light-chromeclipse'


    -- configuring lsp servers
    -- use({ "glepnir/lspsaga.nvim", branch = "main" })

    -- formatting & linting
    -- use("jose-elias-alvarez/null-ls.nvim")
    -- use("jayp0521/mason-null-ls.nvim")

    -- comment with gc
    -- use("numToStr/Comment.nvim")

    -- nvim-tree icons
    -- use("kyazdani42/nvim-web-devicons")

    -- statusline

    if packer_bootstrap then
        require("packer").sync()
    end
end)
