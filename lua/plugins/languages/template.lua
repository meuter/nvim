-------------------------------------------------------------------------------
-- <language>
-------------------------------------------------------------------------------
local language = {
    -- put all lamguage plugin specs here (something like rust-tools or neodev)
}

function language.on_mason_install(install)
    install {
        -- pu all the tools to install using mason
    }
end

function language.on_treesitter_install(install)
    install {
        -- add all the grammars to install for treesitter
    }
end

function language.on_setup_lspzero()
    -- put your lsp configuration here
end

function language.on_setup_dap()
    -- put you dap configuration here
end

return language
