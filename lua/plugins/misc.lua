return {

    -- syntax highlight for Android.bp, XML manifest, AIDL, HIDL, etc.
    "kheaactua/aosp-vim-syntax",

    -- remember position in file when restarting
    {
        "ethanholz/nvim-lastplace",
        config = function()
            require("nvim-lastplace").setup({})
        end,
    },

    -- prevent delete and cut operation from poluting the yank register
    {
        "gbprod/cutlass.nvim",
        config = function()
            require("cutlass").setup({
                cut_key = "m",
                override_del = true,
            })
        end,
    },

    -- move lines around in V mode
    {
        "fedepujol/move.nvim",
        init = function()
            local opts = { noremap = true, silent = true }
            vim.keymap.set("n", "<A-Down>", ":MoveLine(1)<CR>", opts)
            vim.keymap.set("n", "<A-Up>", ":MoveLine(-1)<CR>", opts)
            vim.keymap.set("v", "<A-Down>", ":MoveBlock(1)<CR>", opts)
            vim.keymap.set("v", "<A-Up>", ":MoveBlock(-1)<CR>", opts)
            vim.keymap.set("i", "<A-Down>", "<C-\\><C-N>:MoveLine(1)<CR>i", opts)
            vim.keymap.set("i", "<A-Up>", "<C-\\><C-N>:MoveLine(-1)<CR>i", opts)
        end,
    },


    -- toggle comment blocks/lines
    {
        "terrortylor/nvim-comment",
        config = function()
            require("nvim_comment").setup({})
        end,
        init = function()
            -- Ctrl+/ to toggle comment
            local opts = { noremap = true, silent = true }
            vim.keymap.set("n", "<C-_>", "<CMD>CommentToggle<CR>j", opts)
            vim.keymap.set("i", "<C-_>", "<C-\\><C-N><CMD>CommentToggle<CR>ji", opts)
            vim.keymap.set("v", "<C-_>", ":'<,'>CommentToggle<CR>gv<esc>j", opts)
        end,
    },


    -- show indent guides and hidden tabs/space/return
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            vim.g.indent_blankline_char = "▏"
            vim.g.indent_blankline_show_trailing_blankline_indent = false

            require("indent_blankline").setup({
                enabled = true,
                show_trailing_blankline_indent = false,
                show_first_indent_level = true,
                blankline_char = "▏",
                use_treesitter = true,
                buftype_exclude = {
                    "terminal",
                    "nofile",
                },
                filetype_exclude = {
                    "help",
                    "startify",
                    "dashboard",
                    "packer",
                    "neogitstatus",
                    "NvimTree",
                    "Trouble",
                },
                show_end_of_line = true,
                space_char_blankline = " ",
            })
        end,
    },

    -- hightlight and strip trailing whitespaces
    {
        "ntpeters/vim-better-whitespace",
        config = function()
            vim.g.better_whitespace_enabled = 1
            vim.g.strip_whitespace_on_save = 1
            vim.g.strip_whitespace_confirm = 0

            vim.g.better_whitespace_filetypes_blacklist = {
                "terminal",
                "toggleterm",
                "diff",
                "git",
                "gitcommit",
                "unite",
                "qf",
                "help",
                "markdown",
                "fugitive",
            }
        end,
    },

    -- toggle-able terminal using Ctrl+\
    {
        "akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm").setup({
                open_mapping = [[<c-\>]],
                direction = "tab",
            })
        end,
    },

    -- buffer management
    {
        "theprimeagen/harpoon",
        config = function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")
            vim.keymap.set({ "n", "v" }, "<Space><Space>", mark.add_file)
            vim.keymap.set({ "n", "v" }, "<Bslash>", ui.toggle_quick_menu)
            vim.keymap.set({ "n", "v" }, "1", function() ui.nav_file(1) end)
            vim.keymap.set({ "n", "v" }, "2", function() ui.nav_file(2) end)
            vim.keymap.set({ "n", "v" }, "3", function() ui.nav_file(3) end)
            vim.keymap.set({ "n", "v" }, "4", function() ui.nav_file(4) end)
            vim.keymap.set({ "n", "v" }, "5", function() ui.nav_file(5) end)
            vim.keymap.set({ "n", "v" }, "6", function() ui.nav_file(6) end)
            vim.keymap.set({ "n", "v" }, "7", function() ui.nav_file(7) end)
            vim.keymap.set({ "n", "v" }, "8", function() ui.nav_file(8) end)
            vim.keymap.set({ "n", "v" }, "9", function() ui.nav_file(9) end)
            vim.keymap.set({ "n", "v" }, "0", function() ui.nav_file(10) end)
        end,
    }

}
