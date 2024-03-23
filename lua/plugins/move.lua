return {
    "fedepujol/move.nvim",
    config = true,
    keys = {
        { "<A-Down>", ":MoveLine(1)<CR>",              mode = { "n" } },
        { "<A-Up>",   ":MoveLine(-1)<CR>",             mode = { "n" } },
        { "<A-Down>", ":MoveBlock(1)<CR>",             mode = { "v" } },
        { "<A-Up>",   ":MoveBlock(-1)<CR>",            mode = { "v" } },
        { "<A-Down>", "<C-\\><C-N>:MoveLine(1)<CR>i",  mode = { "i" } },
        { "<A-Up>",   "<C-\\><C-N>:MoveLine(-1)<CR>i", mode = { "i" } },
    }
}
