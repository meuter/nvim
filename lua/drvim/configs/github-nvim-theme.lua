
require("github-theme").setup {
    theme_style = "dark",
    function_style = "NONE",
    comment_style = "NONE",
    keyword_style = "NONE",
    dark_float = true,
}

-- yellow search highlight
vim.api.nvim_set_hl(0, "Search", { bg = "yellow", fg="DimGray" })
