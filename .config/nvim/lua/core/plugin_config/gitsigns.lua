local setup, gitsigns = pcall(require, "gitsigns")
if not setup then
  return
end

gitsigns.setup()

vim.keymap.set('n', '<Leader>bl', ':ToggleBlame<CR>', {})
