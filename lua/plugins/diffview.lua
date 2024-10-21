return {
    "sindrets/diffview.nvim",
    keys = {
        { "<C-g>", "<CMD>DiffviewOpen<CR>", mode = { "n", "v", "i" } },
    },
    cmd = {
        "DiffviewOpen",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "NeogitOrg/neogit",
    },
    config = function()
        require("neogit").setup({
            commit_editor = {
                kind = "floating",
                show_staged_diff = false,
                spell_check = true,
            },
        })

        local actions = require("diffview.config").actions
        require("diffview").setup({
            keymaps = {
                view = {
                    ["<C-b>"] = actions.toggle_files,
                    ["<C-g>"] = "<CMD>DiffviewClose<CR>",
                    ["c"] = function()
                        require("neogit").open({ "commit" })
                    end,
                },
                file_panel = {
                    ["s"] = actions.toggle_stage_entry,
                    ["u"] = actions.toggle_stage_entry,
                    ["<C-b>"] = actions.toggle_files,
                    ["<C-g>"] = "<CMD>DiffviewClose<CR>",
                    ["c"] = function()
                        require("neogit").open({ "commit" })
                    end,
                },
            },
        })
    end,
}
