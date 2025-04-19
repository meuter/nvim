---@module 'snacks'
return {
    "folke/snacks.nvim",
    priotrity = 1000,
    lazy = false,
    keys = {
        -- Pickers
        { "<C-t>",  function() Snacks.picker() end,             mode = { "n", "v", "i" } },
        { "<C-p>",  function() Snacks.picker.smart() end,       mode = { "n", "v", "i" } },
        { "<A-d>",  function() Snacks.picker.diagnostics() end, mode = { "n", "v", "i" } },
        { "<A-p>",  function() Snacks.picker.buffers() end,     mode = { "n", "v", "i" } },
        { "<C-l>",  function() Snacks.picker.grep() end,        mode = { "n", "v", "i" } },
        { "<C-s>",  function() Snacks.picker.grep_word() end,   mode = { "n", "i" } },

        -- Misc
        { "<A-w>",  function() Snacks.bufdelete() end,          mode = { "n", "i", "v" } },

        -- Terminal
        { "<C-\\>", function() Snacks.terminal() end,           mode = { "n", "i", "v", "t" } },
    },
    opts = {
        input = { enabled = true },
        picker = { enabled = true },
        bufdelete = { enabled = true },
        terminal = { enabled = true },
    }
}
