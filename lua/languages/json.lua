-------------------------------------------------------------------------------
-- json
-------------------------------------------------------------------------------
local language = {
    "b0o/schemastore.nvim"
}

function language.on_mason_install(install)
    install {
        "json-lsp"
    }
end

function language.on_treesitter_install(install)
    install {
        "json"
    }
end

function language.on_setup_lspzero()
    require("lsp-zero").configure("jsonls", {
        settings = {
            json = {
                schemas = require("schemastore").json.schemas(),
                validate = { enable = true },
            },
        },
    })
end

return language
