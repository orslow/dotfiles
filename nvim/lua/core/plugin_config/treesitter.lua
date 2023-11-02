require'nvim-treesitter.configs'.setup({
  ensure_installed = {
    "scala",
    "json",
    "python",
    "yaml",
    "markdown",
    "bash",
    "vim",
    "dockerfile",
    "gitignore",
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
  -- indent = { enable = true },
  -- autotag = { enable = true },
})
