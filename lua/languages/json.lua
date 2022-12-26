-------------------------------------------------------------------------------
-- json
-------------------------------------------------------------------------------
local json = {
    plugins = { "b0o/schemastore.nvim" },
    tools = { "json-lsp" },
    grammars = { "json" }
}

function json.on_lspzero_setup()
    require("lsp-zero").configure("jsonls", {
        settings = {
            json = {
                schemas = require("schemastore").json.schemas(),
                validate = { enable = true },
            },
        },
    })
end

return json
