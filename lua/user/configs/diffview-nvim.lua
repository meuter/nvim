-- Lua
local actions = require("diffview.actions")

local function open_commit_window(args)
    vim.cmd("G commit " .. args)
    vim.cmd(vim.api.nvim_replace_termcodes("normal <C-w>J", true, true, true))
end

require("diffview").setup({
    keymaps = {
        view = {
            ["<C-b>"]  = actions.toggle_files,
            ["<C-g>"]  = "<CMD>DiffviewClose<CR>",
            ["cc"]     = function() open_commit_window("") end,
            ["ca"]     = function() open_commit_window("--amend") end,
        },
        file_panel = {
            ["s"]      = actions.toggle_stage_entry,
            ["u"]      = actions.toggle_stage_entry,
            ["<F5>"]   = actions.refresh_files,
            ["<C-b>"]  = actions.toggle_files,
            ["<C-g>"]  = "<CMD>DiffviewClose<CR>",
            ["cc"]     = function() open_commit_window("") end,
            ["ca"]     = function() open_commit_window("--amend") end,
        },
    },
})

-- Use ctrl+g to open fugitive
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-g>", "<CMD>DiffviewOpen<CR>", opts)


