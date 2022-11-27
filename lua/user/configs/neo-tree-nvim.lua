require("neo-tree").setup {
    close_if_last_window = true,
    popup_border_style = "rounded",
    enable_diagnostics = false,
    window = {
        width = 40,
        mappings = {
            ["<F5>"] = "refresh",
            ["<F2>"] = "rename",
        },
    },
    filesystem = {
        filtered_items = {
            visible = false,
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_name = {
                "node_modules",
            },
            never_show = {
                "__pycache__",
                ".DS_Store",
                "thumbs.db",
                ".git"
            },
        },
        follow_current_file = true,
    },
    git_status = {
        window = {
            position = "float",
        },
    },
}

-- Set hightlights
vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "SkyBlue3" })
vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "white" })
vim.api.nvim_set_hl(0, "NeoTreeRootName", { bold = true, fg = "white" })
vim.api.nvim_set_hl(0, "NeoTreeGitAdded", { fg = "green" })
vim.api.nvim_set_hl(0, "NeoTreeGitConflict", { fg = "red" })
vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = "orange" })
vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = "LightYellow" })
vim.api.nvim_set_hl(0, "NeoTreeSymbolicLinkTarget", { fg = "cyan" })

-- Ctrl+B to open file using fuzzy finder
vim.keymap.set({ "n", "v" }, "<C-b>", "<CMD>NeoTreeRevealToggle<CR>")
vim.keymap.set("i", "<C-b>", "<C-\\><C-n><CMD>NeoTreeRevealToggle<CR>")
