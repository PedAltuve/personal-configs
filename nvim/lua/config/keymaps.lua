-- Keybinds for yanking to system clipboard
vim.keymap.set("n", "<leader>y", '"+yy', { desc = "Yank line to clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank selection to clipboard" })
vim.keymap.set("n", "<leader>Y", 'gg"+yG', { desc = "Yank entire buffer to clipboard" })
vim.keymap.set("n", "<leader>x", ":tabclose<CR>", { desc = "Close tab" })
vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle Git Blame" })
