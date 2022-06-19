require("telescope").setup {
    pickers = {
        buffers = {
            theme = "dropdown",
            previewer = false
        }
    },
    defaults = {
        prompt_prefix = "🔎 ",
        color_devicons = true,
        selection_caret = "❯ ",
        preview = {
            treesitter = false,
        },
    },
}

-- Ctrl+P to open file using fuzzy finder
vim.keymap.set("n", "<C-p>", "<CMD>ProjectFiles<CR>")
vim.keymap.set("n", "<C-p>", "<CMD>ProjectFiles<CR>")
vim.keymap.set("i", "<C-p>", "<C-\\><C-N><CMD>ProjectFiles<CR>")

