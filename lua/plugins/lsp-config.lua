return {
    "neovim/nvim-lspconfig",
    config = function()
        require("lspconfig.ui.windows").default_options = { border = "single" }
    end
}
