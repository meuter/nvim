require("trouble").setup({
    signs = {
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = ""
    },
})

-- Use ctrl+g to open fugitive
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<F10>", "<CMD>TroubleToggle<CR>", opts)


