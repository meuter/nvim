return {
    "folke/lazydev.nvim",
    ft = "lua",
    dependency = {
        { "Bilal2453/luvit-meta", lazy = true },
    },
    opts = {
        library = {
            { path = "luvit-meta/library", words = { "vim%.uv" } },
        },
    },
}
