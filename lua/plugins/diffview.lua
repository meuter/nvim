local function open_commit_window(args)
    vim.cmd("DiffviewClose")
    vim.cmd("G commit " .. args)
    vim.cmd(vim.api.nvim_replace_termcodes("normal <C-w>J", true, true, true))
end

return {
    "sindrets/diffview.nvim",
    -- NOTE(cme): HEAD requires git 2.35+ which is not available on older systems
    commit = "9359f7b1dd3cb9fb1e020f57a91f8547be3558c6",
    keys = {
        { "<C-g>", "<CMD>DiffviewOpen<CR>", mode = { "n", "v", "i" } },
    },
    cmd = {
        "DiffviewOpen"
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "tpope/vim-fugitive",
    },
    config = function()
        local actions = require("diffview.config").actions
        require("diffview").setup {
            enhanced_diff_hl = true,
            hooks = {
                diff_buf_read = function()
                    vim.opt_local.foldlevel = 99
                    vim.opt_local.foldenable = false
                end,
                diff_buf_win_enter = function()
                    vim.opt_local.foldlevel = 99
                    vim.opt_local.foldenable = false
                end
            },
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
        }
    end
}
