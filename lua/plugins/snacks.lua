return {
    "folke/snacks.nvim",
    priotrity = 1000,
    lazy = false,
    keys = {
        { "<C-t>", function() Snacks.picker() end,             mode = { "n", "v", "i" } },
        { "<C-p>", function() Snacks.picker.smart() end,       mode = { "n", "v", "i" } },
        { "<A-d>", function() Snacks.picker.diagnostics() end, mode = { "n", "v", "i" } },
        { "<A-p>", function() Snacks.picker.buffers() end,     mode = { "n", "v", "i" } },
        { "<C-l>", function() Snacks.picker.grep() end,        mode = { "n", "v", "i" } },
        { "<C-s>", function() Snacks.picker.grep_word() end,   mode = { "n", "i" } },
    },
    opts = {
        input = { enabled = true },
        picker = { enabled = true },
    }
}
