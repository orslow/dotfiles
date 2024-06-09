require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    -- "jedi_language_server",
    -- "pyright",
    -- "gopls",
    -- "sqlls",
    -- "terraformls",
    -- "bashls",
    -- "clangd",
    -- "dockerls",
    -- "jsonls",
  }
})

local on_attach = function(_, bufnr)
  -- local opts = { noremap = true, silent = true, buffer = bufnr }
  local opts = {}

  -- set keybinds
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gr", require('telescope.builtin').lsp_references, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

  -- vim.keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
  -- vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
  -- vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
  -- vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
  -- vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
  -- vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
  -- vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
  -- vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  -- vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
  -- vim.keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig").sqlls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig").gopls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig").terraformls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- local metals_config = require("metals").bare_config()
-- 
-- metals_config.settings = {
--   showImplicitArguments = true,
-- }
-- 
-- metals_config.capabilities = capabilities
-- 
-- local dap = require("dap")
-- 
-- dap.configurations.scala = {
--   {
--     type = "scala",
--     request = "launch",
--     name = "RunOrTest",
--     metals = {
--       runType = "runOrTestFile",
--       --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
--     },
--   },
--   {
--     type = "scala",
--     request = "launch",
--     name = "Test Target",
--     metals = {
--       runType = "testTarget",
--     },
--   },
-- }
-- 
-- metals_config.on_attach = function(_, bufnr)
--   require("metals").setup_dap()
-- end
-- 
-- 
-- local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
-- vim.api.nvim_create_autocmd("FileType", {
--   -- NOTE: You may or may not want java included here. You will need it if you
--   -- want basic Java support but it may also conflict if you are using
--   -- something like nvim-jdtls which also works on a java filetype autocmd.
--   pattern = { "scala", "sbt", "java" },
--   callback = function()
--     require("metals").initialize_or_attach(metals_config)
--   end,
--   group = nvim_metals_group,
-- })
