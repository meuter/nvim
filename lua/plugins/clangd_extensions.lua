return {
    "p00f/clangd_extensions.nvim",
    dependencies = {
        "VonHeikemen/lsp-zero.nvim",
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("clangd_extensions").setup {
            server = require("lsp-zero").build_options("clangd", {
                cmd = {
                    "clangd",
                    "-j=4",
                    "--clang-tidy",
                    "--background-index",
                    "--suggest-missing-includes",
                    "--header-insertion=never",
                    "--fallback-style=webkit",
                    "--all-scopes-completion",
                    "--completion-style=detailed",
                    "--pch-storage=memory",
                },
            })
        }
    end
}
