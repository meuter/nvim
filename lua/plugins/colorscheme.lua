---@diagnostic disable: missing-fields
return {
    "rebelot/kanagawa.nvim",
    config = function()
        require("kanagawa").setup({
            commentStyle = { italic = false },
            keywordStyle = { italic = false },
        })
        require("kanagawa").load("wave")
    end
}
