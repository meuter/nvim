return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    event = "VimEnter",
    keys = {
        { "<C-t>", "<CMD>Telescope<CR>",             mode = { "n", "v", "i" } },
        { "<C-p>", "<CMD>Telescope find_files<CR>",  mode = { "n", "v", "i" } },
        { "<A-d>", "<CMD>Telescope diagnostics<CR>", mode = { "n", "v", "i" } },
        { "<A-p>", "<CMD>Telescope buffers<CR>",     mode = { "n", "v", "i" } },
        { "<C-l>", "<CMD>Telescope live_grep<CR>",   mode = { "n", "v", "i" } },
        { "<C-s>", "<CMD>Telescope grep_string<CR>", mode = { "n", "i" } },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {}
}
