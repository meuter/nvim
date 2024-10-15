return {
    "folke/trouble.nvim",
    keys = {
        { "<F10>",   "<CMD>Trouble diagnostics toggle<CR>",      mode = { "n", "v", "i" } },
        { "<C-F10>", function() vim.diagnostic.open_float() end, mode = { "n", "v" } }
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
