-- Alt+Up/Down to move lines around
vim.keymap.set("n", "<A-Down>", ":MoveLine(1)<CR>")
vim.keymap.set("n", "<A-Up>",   ":MoveLine(-1)<CR>")
vim.keymap.set("v", "<A-Down>", ":MoveBlock(1)<CR>")
vim.keymap.set("v", "<A-Up>",   ":MoveBlock(-1)<CR>")
vim.keymap.set("i", "<A-Down>", "<C-\\><C-N>:MoveLine(1)<CR>i")
vim.keymap.set("i", "<A-Up>",   "<C-\\><C-N>:MoveLine(-1)<CR>i")


