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
        local telescope = require("telescope")
        local action_state = require("telescope.actions.state")
        telescope.setup({
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                },
            },
            pickers = {
                git_commits = {
                    mappings = {
                        i = {
                            ["<CR>"] = function()
                                -- when selecting a commit, open it in DiffView
                                local selected_entry = action_state.get_selected_entry()
                                local value = selected_entry.value
                                local cmd = 'DiffviewOpen ' .. value .. '~1..' .. value
                                vim.api.nvim_win_close(0, true)
                                vim.cmd(cmd)
                            end
                        }
                    }
                }
            }
        })
        telescope.load_extension("fzf")
        telescope.load_extension("ui-select")
    end,
}
