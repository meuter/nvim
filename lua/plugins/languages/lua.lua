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

local lua = { neodev }

function lua.on_mason_install(install)
    install { "lua-language-server" }
end

function lua.on_treesitter_install(install)
    install { "lua" }
end

function lua.on_setup_lspzero()
    require("neodev").setup {
        library = {
            plugins = false,
            runtime = false
        }
    }
    require("lsp-zero").configure("sumneko_lua", {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                    disable = { "different-requires" }
                },
                telemetry = { enable = false, },
                workspace = { checkThirdParty = false, },
            },
        }
    })
end

return lua
