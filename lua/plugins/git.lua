-------------------------------------------------------------------------------
-- gitsigns
-------------------------------------------------------------------------------
local function sign(op, char)
    return {
        hl = "GitSigns" .. op,
        text = char,
        numhl = "GitSigns" .. op .. "Nr",
        linehl = "GitSigns" .. op .. "Ln",
    }
end

local gitsigns = {
    "lewis6991/gitsigns.nvim"
}

function gitsigns.config()
    require("gitsigns").setup {
        signs = {
            add = sign("Add", "▎"),
            untracked = sign("Add", "▎"),
            change = sign("Change", "▎"),
            changedelete = sign("Change", "▎"),
            delete = sign("Delete", "▎"),
            topdelete = sign("Delete", "▎"),
        },
    }
end

-------------------------------------------------------------------------------
-- diffview
-------------------------------------------------------------------------------
local diffview = {
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
    }
}

local function open_commit_window(args)
    vim.cmd("G commit " .. args)
    vim.cmd(vim.api.nvim_replace_termcodes("normal <C-w>J", true, true, true))
end

function diffview.config()
    local actions = require("diffview.config").actions
    require("diffview").setup {
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

-------------------------------------------------------------------------------
-- git
-------------------------------------------------------------------------------
return {
    gitsigns,
    diffview
}
