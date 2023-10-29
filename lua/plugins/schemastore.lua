return {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
        "b0o/schemastore.nvim",
    },
    opts = function(_, opts)
        -- if the setup is done after lsp-zero's setup, the store does not work
        require("plugins.lsp-zero").on_setup(opts, function(lsp)
            lsp.configure("jsonls", {
                settings = {
                    json = {
                        schemas = require("schemastore").json.schemas(),
                        validate = {
                            enable = true
                        },
                    },
                },
            })
            lsp.configure("yamlls", {
                settings = {
                    yaml = {
                        schemas = require('schemastore').yaml.schemas(),
                    },
                    redhat = {
                        telemetry = {
                            -- them sneaky bastards...
                            enabled = false
                        }
                    }
                },
            })
        end)
    end
}
