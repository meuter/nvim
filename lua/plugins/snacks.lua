---@module 'snacks'
return {
    "folke/snacks.nvim",
    priotrity = 1000,
    lazy = false,
    keys = {
        -- Pickers
        { "<C-t>",  function() Snacks.picker() end,                       mode = { "n", "v", "i" } },
        { "<C-p>",  function() Snacks.picker.files() end,                 mode = { "n", "v", "i" } },
        { "<A-d>",  function() Snacks.picker.diagnostics() end,           mode = { "n", "v", "i" } },
        { "<A-p>",  function() Snacks.picker.buffers() end,               mode = { "n", "v", "i" } },
        { "<C-l>",  function() Snacks.picker.grep() end,                  mode = { "n", "v", "i" } },
        { "<C-s>",  function() Snacks.picker.grep_word() end,             mode = { "n", "i" } },

        -- Misc
        { "<A-w>",  function() Snacks.bufdelete() end,                    mode = { "n", "i", "v" } },

        -- Terminal
        { "<C-\\>", function() Snacks.terminal() end,                     mode = { "n", "i", "v", "t" } },

        -- LSP
        { "gd",     function() Snacks.picker.lsp_definitions() end,       mode = "n" },
        { "gr",     function() Snacks.picker.lsp_references() end,        mode = "n" },
        { "gD",     function() Snacks.picker.lsp_declarations() end,      mode = "n" },
        { "gI",     function() Snacks.picker.lsp_implementations() end,   mode = "n" },
        { "gs",     function() Snacks.picker.lsp_symbols() end,           mode = "n" },
        { "gS",     function() Snacks.picker.lsp_workspace_symbols() end, mode = "n" },
        { "gt",     function() Snacks.picker.diagnostics() end,           mode = "n" },
        { "grn",    function() vim.lsp.buf.rename() end,                  mode = "n" },
        { "gca",    function() vim.lsp.buf.code_action() end,             mode = "n" },
        { "T",      function() vim.diagnostic.open_float() end,           mode = "n" },
        {
            "<A-i>",
            function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end,
            mode = "n"
        }

    },
    opts = {
        picker = { enabled = true },
        bufdelete = { enabled = true },
        terminal = { enabled = true },
    }
}
