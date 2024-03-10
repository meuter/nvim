return {
    "nvim-treesitter/nvim-treesitter",
    -- treesitter HEAD is often broken, so PIN it to known version
    tag = "v0.9.2",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = {
                "bash",
                "css",
                "scss",
                "c",
                "cpp",
                "cmake",
                "make",
                "dockerfile",
                "yaml",
                "go",
                "html",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "toml",
                "rust",
                "typescript",
                "javascript",
                "tsx"
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            context_commentstring = {
                enable = true,
                enable_autocmd = false,
            },
            indent = {
                enable = true,
                disable = { "yaml" },
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<c-space>",
                    node_incremental = "<c-space>",
                },
            },
        }
    end
}
