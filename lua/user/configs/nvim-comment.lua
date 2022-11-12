require("nvim_comment").setup{}

-- Ctrl+/ to toggle comment
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-_>", "<CMD>CommentToggle<CR>j", opts)
vim.keymap.set("i", "<C-_>", "<C-\\><C-N><CMD>CommentToggle<CR>ji", opts)
vim.keymap.set("v", "<C-_>", ":'<,'>CommentToggle<CR>gv<esc>j", opts)


