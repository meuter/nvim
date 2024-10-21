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
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        { "nvim-telescope/telescope-ui-select.nvim" },
        { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
        require("telescope").setup({
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                },
            },
        })
        require("telescope").load_extension("fzf")
        require("telescope").load_extension("ui-select")
    end,
}
