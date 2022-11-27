vim.g.indent_blankline_char = "▏"
vim.g.indent_blankline_show_trailing_blankline_indent = false

require("indent_blankline").setup {
    enabled = true,
    show_trailing_blankline_indent = false,
    show_first_indent_level = true,
    blankline_char = "▏",
    use_treesitter = true,
    buftype_exclude = {
        "terminal",
        "nofile"
    },
    filetype_exclude = {
        "help",
        "startify",
        "dashboard",
        "packer",
        "neogitstatus",
        "NvimTree",
        "Trouble",
    },
    show_end_of_line = true,
    space_char_blankline = " ",
}

