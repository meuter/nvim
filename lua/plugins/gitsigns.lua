return {
    "lewis6991/gitsigns.nvim",
    event = "VimEnter",
    keys = {
        { "<leader>gp", "<CMD>Gitsigns preview_hunk<CR>", mode = { "n", "v" } },
    },
    opts = {
        signs = {
            add = { text = "┃" },
            change = { text = "┃" },
            delete = { text = "┃" },
            topdelete = { text = "┃" },
            changedelete = { text = "┃" },
            untracked = { text = "┃" },
        },
    },
}
