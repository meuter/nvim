return {
    "ntpeters/vim-better-whitespace",
    config = function()
        vim.g.better_whitespace_enabled = 1
        vim.g.strip_whitespace_on_save = 1
        vim.g.strip_whitespace_confirm = 0
        vim.g.better_whitespace_filetypes_blacklist = {
            "terminal",
            "toggleterm",
            "diff",
            "git",
            "gitcommit",
            "unite",
            "qf",
            "help",
            "markdown",
            "fugitive",
        }
    end
}
