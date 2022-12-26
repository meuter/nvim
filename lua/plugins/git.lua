return {
    -- the orginal git integration for vim
    { "tpope/vim-fugitive" },

    -- display green/red/blue guidelines for git
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            local function sign(op, char)
                return {
                    hl = "GitSigns" .. op,
                    text = char,
                    numhl = "GitSigns" .. op .. "Nr",
                    linehl = "GitSigns" .. op .. "Ln",
                }
            end

            require("gitsigns").setup({
                signs = {
                    add = sign("Add", "▎"),
                    untracked = sign("Add", "▎"),
                    change = sign("Change", "▎"),
                    changedelete = sign("Change", "▎"),
                    delete = sign("Delete", "▎"),
                    topdelete = sign("Delete", "▎"),
                },
            })
        end,
    },

    -- Git interation
    {
        "sindrets/diffview.nvim",
        -- NOTE(cme): HEAD requires git 2.35+ which is not available on older systems
        commit = "9359f7b1dd3cb9fb1e020f57a91f8547be3558c6",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local actions = require("diffview.config").actions

            local function open_commit_window(args)
                vim.cmd("G commit " .. args)
                vim.cmd(vim.api.nvim_replace_termcodes("normal <C-w>J", true, true, true))
            end

            require("diffview").setup({
                keymaps = {
                    view = {
                        ["<C-b>"] = actions.toggle_files,
                        ["<C-g>"] = "<CMD>DiffviewClose<CR>",
                        ["cc"] = function()
                            open_commit_window("")
                        end,
                        ["ca"] = function()
                            open_commit_window("--amend")
                        end,
                    },
                    file_panel = {
                        ["s"] = actions.toggle_stage_entry,
                        ["u"] = actions.toggle_stage_entry,
                        ["<F5>"] = actions.refresh_files,
                        ["<C-b>"] = actions.toggle_files,
                        ["<C-g>"] = "<CMD>DiffviewClose<CR>",
                        ["cc"] = function()
                            open_commit_window("")
                        end,
                        ["ca"] = function()
                            open_commit_window("--amend")
                        end,
                    },
                },
            })

            -- Use ctrl+g to open fugitive
            vim.keymap.set({ "n", "v" }, "<C-g>", "<CMD>DiffviewOpen<CR>")
            vim.keymap.set("i", "<C-g>", "<C-\\><C-n><CMD>DiffviewOpen<CR>")
        end,
    },




}
