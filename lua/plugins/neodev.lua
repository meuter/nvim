return {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
        "folke/neodev.nvim",
    },
    opts = function(_, opts)
        require("plugins.lsp-zero").on_setup(opts, function(lsp)
            require("neodev").setup {
                library = {
                    plugins = false,
                    runtime = false
                }
            }
            lsp.configure("sumneko_lua", {
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        telemetry = { enable = false },
                        workspace = { checkThirdParty = false },
                    },
                }
            })
        end)
    end
}