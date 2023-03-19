return {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    -- https://github.com/utilyre/barbecue.nvim/issues/61
    branch = "fix/E36",
    dependencies = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        theme = {
            -- match the color of lualine using the seoul256 theme
            normal = { bg = "#30302c" },
        }
    }
}
