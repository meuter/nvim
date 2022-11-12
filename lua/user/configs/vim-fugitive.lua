
-- Use ctrl+g to open fugitive
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-g>", "<cmd>tabnew | G<cr><C-w>o", opts)

