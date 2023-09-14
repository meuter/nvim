return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    cmd = {
        "Neotree"
    },
    keys = {
        { "<C-b>", "<CMD>Neotree toggle<CR>", mode = { "n", "v", "i" } }
    },
    opts = {
        close_if_last_window = true,
        popup_border_style = "single",
        enable_diagnostics = false,
        window = {
            width = 30,
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
                    ".git",
                },
            },
            follow_current_file = true,
            use_libuv_file_watcher = true,
        },
        default_component_configs = {
            icon = {
                folder_empty = ""
            }
        }
    }
}
