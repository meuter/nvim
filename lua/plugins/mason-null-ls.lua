return {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "jose-elias-alvarez/null-ls.nvim",
        "nvim-lua/plenary.nvim",
        "lukas-reineke/lsp-format.nvim",
    },
    config = function()
        require("mason-null-ls").setup {
            automatic_setup = true,
            ensure_installed = {
                "isort",
                "black",
                "eslint_lsp",
                "prettierd"
            },
            handlers = {}
        }
        require("null-ls").setup {
            on_attach = require("lsp-format").on_attach,
            border = "single"
        }
    end
}
