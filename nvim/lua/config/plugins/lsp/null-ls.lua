local setup, null_ls = pcall(require, "null-ls")
if not setup then
  return
end

local fmt = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  sources = {
    -- fmt.black,
    -- fmt.fixjson,
    -- fmt.terraform_fmt,
  }
})
