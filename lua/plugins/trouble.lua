return {
    "folke/trouble.nvim",
    keys = {
        { "<F10>", "<CMD>Trouble diagnostics toggle<CR>", mode = { "n", "v", "i" } }
    },
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        signs = {
            error = "",
            warning = "",
            hint = "",
            information = "",
            other = "",
        },
    }
}
