-------------------------------------------------------------------------------
-- neodev
-------------------------------------------------------------------------------
local neodev = {
    "folke/neodev.nvim",
    dependencies = {
        "hrsh7th/nvim-cmp",
    }
}

-------------------------------------------------------------------------------
-- lua
-------------------------------------------------------------------------------
local lua = {
    plugins = {
        neodev
    },
    tools = {
        "lua-language-server"
    },
    grammars = {
        "lua"
    }
}

function lua.on_lspzero_setup()
    require("neodev").setup {
        library = {
            plugins = false,
            runtime = false
        }
    }
    require("lsp-zero").configure("sumneko_lua", {
        settings = {
            Lua = {
                diagnostics = { globals = { "vim" } },
                telemetry = { enable = false },
                workspace = { checkThirdParty = false },
            },
        }
    })
end

return lua
