-- TODO(cme): map F2 to rename a file
-- TODO(cme): map F5 to refresh
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
        git_status = {
            symbols = {
                added = "",
                deleted = "",
                modified = "",
                renamed = "➜",
                untracked = "★",
                ignored = "◌",
                unstaged = "✗",
                staged = "✓",
                conflict = "",
            },
        },
    },
    window = {
        width = 40,
        mappings = {
            ["o"] = "open",
        },
    },
    filesystem = {
        filtered_items = {
            visible = false,
            hide_dotfiles = true,
            hide_gitignored = false,
            hide_by_name = {
                ".DS_Store",
                "thumbs.db",
                "node_modules",
                "__pycache__",
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

