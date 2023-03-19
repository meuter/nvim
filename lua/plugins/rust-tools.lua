return {
    "simrat39/rust-tools.nvim",
    dependencies = {
        "VonHeikemen/lsp-zero.nvim",
        "neovim/nvim-lspconfig",
        "nvim-lua/plenary.nvim",
        "mfussenegger/nvim-dap",
    },
    config = function()
        require("rust-tools").setup {
            server = require("lsp-zero").build_options("rust_analyzer", {}),
        }
    end
}