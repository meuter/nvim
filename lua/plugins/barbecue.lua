return {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    -- https://github.com/utilyre/barbecue.nvim/issues/61
    branch = "fix/E36",
    event = "BufRead *",
    dependencies = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons",
    },
    config = true
}
