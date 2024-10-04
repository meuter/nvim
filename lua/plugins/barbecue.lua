return {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    event = "BufRead *",
    dependencies = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        exclude_filetypes = { "netrw", "toggleterm" },
    }
}
