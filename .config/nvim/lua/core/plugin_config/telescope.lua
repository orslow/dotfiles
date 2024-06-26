local builtin = require('telescope.builtin')

vim.keymap.set('n', '<Space>ff', "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>", {})
-- vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
-- vim.keymap.set('n', '<Space>fg', builtin.live_grep, {})
-- vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})

-- local actions_setup, actions = pcall(require, "telescope.actions")
-- if not actions_setup then
--   return
-- end
-- 
-- telescope.setup({
--   defaults = {
--     mappings = {
--       i = {
--         ["<C-k>"] = actions.move_selection_previous,
--         ["<C-j>"] = actions.move_selection_next,
--         ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, 
--       }
--     }
--   }
-- })
-- 
-- telescope.load_extension("fzf")
