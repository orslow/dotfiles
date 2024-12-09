require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "pyright",
    "gopls",
    "sqlls",
    "terraformls",
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
  offset_encoding = "utf-8",
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig").sqlls.setup({
  offset_encoding = "utf-8",
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig").gopls.setup({
  offset_encoding = "utf-8",
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig").terraformls.setup({
  offset_encoding = "utf-8",
  on_attach = on_attach,
  capabilities = capabilities,
})
