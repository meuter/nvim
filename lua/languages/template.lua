-------------------------------------------------------------------------------
-- <language>
-------------------------------------------------------------------------------
local language = {
    -- put all language specific plugin specs here
    -- something like rust-tools for rust or neodev for lua
}

function language.on_mason_install(install)
    install {
        -- put all the mason tools here
    }
end

function language.on_treesitter_install(install)
    install {
        -- put all the treesitter grammars here
    }
end

function language.on_setup_lspzero()
    -- put your lsp configuration here
end

function language.on_setup_dap()
    -- put you dap configuration here
end

return language
