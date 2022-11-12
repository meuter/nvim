local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<A-Down>", ":MoveLine(1)<CR>", opts)
vim.keymap.set("n", "<A-Up>",   ":MoveLine(-1)<CR>", opts)
vim.keymap.set("v", "<A-Down>", ":MoveBlock(1)<CR>", opts)
vim.keymap.set("v", "<A-Up>",   ":MoveBlock(-1)<CR>", opts)
vim.keymap.set("i", "<A-Down>", "<C-\\><C-N>:MoveLine(1)<CR>i", opts)
vim.keymap.set("i", "<A-Up>",   "<C-\\><C-N>:MoveLine(-1)<CR>i", opts)

