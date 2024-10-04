return {
    "p00f/clangd_extensions.nvim",
    ft = { "c", "cpp" },
    dependencies = {
        "VonHeikemen/lsp-zero.nvim",
        "neovim/nvim-lspconfig",
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<A-h>", "<CMD>ClangdSwitchSourceHeader<CR>", mode = { "n", "i", "v" } },
    },
    config = function()
        local server_options = require("lsp-zero").build_options("clangd", {
            settings = {
                clangd = {
                    InlayHints = {
                        Designators = true,
                        Enabled = true,
                        ParameterNames = true,
                        DeducedTypes = true,
                    },
                },
                fallbackFlags = { "-std=c++20" },
            },
            cmd = {
                "clangd",
                "-j=4",
                "--clang-tidy",
                "--background-index",
                "--header-insertion=never",
                "--fallback-style=webkit",
                "--all-scopes-completion",
                "--completion-style=detailed",
                "--pch-storage=memory",
            }
        })
        require("lspconfig").clangd.setup(server_options)
        require("clangd_extensions").setup()
    end
}
