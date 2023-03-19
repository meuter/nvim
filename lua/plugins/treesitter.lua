return {
    "nvim-treesitter/nvim-treesitter",
    -- the head of treesitter is always broken!
    commit = "4cccb6f494eb255b32a290d37c35ca12584c74d0",
    dependencies = {
        { "nvim-treesitter/nvim-treesitter-textobjects" },
        { "p00f/nvim-ts-rainbow" }
    },
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = {
                "bash",
                "c",
                "cpp",
                "cmake",
                "make",
                "dockerfile",
                "go",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "rust",
                "toml",
                "javascript",
                "typescript",
                "html",
                "yaml",
                "css",
                "yaml"
            },
            auto_install = true,
            sync_install = true,
            rainbow = {
                enable = true,
                disable = { "html" },
                extended_mode = false,
                colors = {
                    "#b16286",
                    "#a89984",
                    "#d79921",
                    "#689d6a",
                    "#d65d0e",
                    "#458588",
                },
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
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["al"] = "@loop.outer",
                        ["il"] = "@loop.inner",
                        ["ab"] = "@block.outer",
                        ["ib"] = "@block.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ap"] = "@parameter.outer",
                        ["ip"] = "@parameter.inner",
                    },
                },
            },
        }
    end
}
