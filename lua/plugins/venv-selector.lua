return {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "nvim-telescope/telescope.nvim"
    },
    config = true,
    event = "VeryLazy",
    cmd = "VenvSelect"
}
