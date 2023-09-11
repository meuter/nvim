return {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        vim.g.rainbow_delimiters = {
            highlight = {
                "RainbowDelimiterYellow",
                "RainbowDelimiterOrange",
                "RainbowDelimiterViolet",
                "RainbowDelimiterCyan",
                "RainbowDelimiterBlue",
                "RainbowDelimiterGreen",
                "RainbowDelimiterRed",
            },
        }
    end
}
