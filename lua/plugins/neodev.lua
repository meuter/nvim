return {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
        "folke/neodev.nvim",
        "simrat39/inlay-hints.nvim",
    },
    opts = function(_, opts)
        require("plugins.lsp-zero").on_setup(opts, function(lsp)
            require("neodev").setup {
                library = {
                    plugins = false,
                    runtime = false
                }
            }
            lsp.configure("lua_ls", {
                on_attach = function(client, buffer)
                    require("inlay-hints").on_attach(client, buffer)
                end,
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        telemetry = { enable = false },
                        workspace = { checkThirdParty = false },
                        hint = { enable = true }
                    },
                }
            })
        end)
    end
}
