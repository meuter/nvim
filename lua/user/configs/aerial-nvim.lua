require('aerial').setup{
    min_width = 28,
    show_guides = true,
}

-- Ctrl+o to toggle outline panel
vim.keymap.set("n", "<C-o>", "<CMD>AerialToggle<CR>")
vim.keymap.set("n", "<C-o>", "<CMD>AerialToggle<CR>")
vim.keymap.set("i", "<C-o>", "<C-\\><C-N><CMD>AerialToggle<CR>")
