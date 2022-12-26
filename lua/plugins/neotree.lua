local neotree = {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "kyazdani42/nvim-web-devicons"
    }
}

function neotree.config()
    require("neo-tree").setup {
        close_if_last_window = true,
        popup_border_style = "single",
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
                    ".git",
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
end

function neotree.init()
    -- Ctrl+B to open file using fuzzy finder
    vim.keymap.set({ "n", "v" }, "<C-b>", "<CMD>NeoTreeRevealToggle<CR>")
    vim.keymap.set("i", "<C-b>", "<C-\\><C-n><CMD>NeoTreeRevealToggle<CR>")
end

return neotree
