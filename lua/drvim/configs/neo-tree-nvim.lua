require("neo-tree").setup {
    close_if_last_window = true,
    popup_border_style = "rounded",
    enable_diagnostics = true,
    default_component_configs = {
        indent = {
            padding = 0,
            with_expanders = false,
        },
        icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "",
            default = "",
        },
        name = {
            use_git_status_colors = true,
        },
        git_status = {
            symbols = {
                added = "",
                deleted = "",
                modified = "",
                renamed = "➜",
                untracked = "★",
                ignored = "◌",
                unstaged = "u",
                staged = "s",
                conflict = "",
            },
        },
    },
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
        hijack_netrw_behavior = "open_current",
        use_libuv_file_watcher = true,
    },
    git_status = {
        window = {
            position = "float",
        },
    },
    event_handlers = {
        {
            event = "vim_buffer_enter",
            handler = function(_)
                if vim.bo.filetype == "neo-tree" then
                    vim.wo.signcolumn = "auto"
                end
            end,
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
vim.keymap.set("n", "<C-b>", "<CMD>NeoTreeFocusToggle<CR>")
vim.keymap.set("n", "<C-b>", "<CMD>NeoTreeFocusToggle<CR>")
vim.keymap.set("i", "<C-b>", "<C-\\><C-N><CMD>NeoTreeFocusToggle<CR>")
