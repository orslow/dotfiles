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

local map = vim.keymap.set
local fn = vim.fn

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

  "hashivim/vim-terraform",

  -- tmux "z"
  "szw/vim-maximizer",

  -- git
  "lewis6991/gitsigns.nvim",
  {
    "FabijanZulj/blame.nvim",
    config = function()
      require("blame").setup()
    end
  },

  -- highlighting
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",

  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",

  -- -- lsp for scala
  -- {
  --   "scalameta/nvim-metals",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "mfussenegger/nvim-dap",
  --   }
  -- },
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "j-hui/fidget.nvim",
        opts = {},
      },
      {
        "mfussenegger/nvim-dap",
        config = function(self, opts)
          -- Debug settings if you're using nvim-dap
          local dap = require("dap")

          dap.configurations.scala = {
            {
              type = "scala",
              request = "launch",
              name = "RunOrTest",
              metals = {
                runType = "runOrTestFile",
                --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
              },
            },
            {
              type = "scala",
              request = "launch",
              name = "Test Target",
              metals = {
                runType = "testTarget",
              },
            },
          }
        end
      },
    },
    ft = { "scala", "sbt", "java" },
    opts = function()
      local metals_config = require("metals").bare_config()

      -- Example of settings
      metals_config.settings = {
        showImplicitArguments = true,
        excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
      }

      -- *READ THIS*
      -- I *highly* recommend setting statusBarProvider to either "off" or "on"
      --
      -- "off" will enable LSP progress notifications by Metals and you'll need
      -- to ensure you have a plugin like fidget.nvim installed to handle them.
      --
      -- "on" will enable the custom Metals status extension and you *have* to have
      -- a have settings to capture this in your statusline or else you'll not see
      -- any messages from metals. There is more info in the help docs about this
      metals_config.init_options.statusBarProvider = "off"

      -- Example if you are using cmp how to make sure the correct capabilities for snippets are set
      metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

      metals_config.on_attach = function(client, bufnr)
        require("metals").setup_dap()

        -- LSP mappings
        map("n", "gd", vim.lsp.buf.definition)
        map("n", "K", vim.lsp.buf.hover)
        map("n", "gi", vim.lsp.buf.implementation)
        map("n", "gr", vim.lsp.buf.references)
        map("n", "gds", vim.lsp.buf.document_symbol)
        map("n", "gws", vim.lsp.buf.workspace_symbol)
        map("n", "<leader>cl", vim.lsp.codelens.run)
        map("n", "<leader>sh", vim.lsp.buf.signature_help)
        map("n", "<leader>rn", vim.lsp.buf.rename)
        map("n", "<leader>f", vim.lsp.buf.format)
        map("n", "<leader>ca", vim.lsp.buf.code_action)

        map("n", "<leader>ws", function()
          require("metals").hover_worksheet()
        end)

        -- all workspace diagnostics
        map("n", "<leader>aa", vim.diagnostic.setqflist)

        -- all workspace errors
        map("n", "<leader>ae", function()
          vim.diagnostic.setqflist({ severity = "E" })
        end)

        -- all workspace warnings
        map("n", "<leader>aw", function()
          vim.diagnostic.setqflist({ severity = "W" })
        end)

        -- buffer diagnostics only
        map("n", "<leader>d", vim.diagnostic.setloclist)

        map("n", "[c", function()
          vim.diagnostic.goto_prev({ wrap = false })
        end)

        map("n", "]c", function()
          vim.diagnostic.goto_next({ wrap = false })
        end)

        -- Example mappings for usage with nvim-dap. If you don't use that, you can
        -- skip these
        map("n", "<leader>dc", function()
          require("dap").continue()
        end)

        map("n", "<leader>dr", function()
          require("dap").repl.toggle()
        end)

        map("n", "<leader>dK", function()
          require("dap.ui.widgets").hover()
        end)

        map("n", "<leader>dt", function()
          require("dap").toggle_breakpoint()
        end)

        map("n", "<leader>dso", function()
          require("dap").step_over()
        end)

        map("n", "<leader>dsi", function()
          require("dap").step_into()
        end)

        map("n", "<leader>dl", function()
          require("dap").run_last()
        end)
      end

      return metals_config
    end,
    config = function(self, metals_config)
      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = self.ft,
        callback = function()
          require("metals").initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })
    end

  },

  -- colors
  "projekt0n/github-nvim-theme",
  -- "josebalius/vim-light-chromeclipse"
  -- "yasukotelin/shirotelin",
  -- "nelstrom/vim-mac-classic-theme",
  -- "romgrk/github-light.vim",
  -- "cormacrelf/vim-colors-github",


}, {})

require('plugins')
