require("nvim-treesitter.configs").setup {
    sync_install = true,
    ignore_install = {},
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    indent = {
        enable = true,
        disable = { "yaml" }
    },
    rainbow = {
        enable = true,
        disable = { "html" },
        extended_mode = false,
        max_file_lines = nil,
    },
    autopairs = { enable = true },
    autotag = { enable = true },
    incremental_selection = { enable = true },
}
