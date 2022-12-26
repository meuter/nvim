-------------------------------------------------------------------------------
-- somelang
-------------------------------------------------------------------------------
local somelang = {
    plugins = {
        -- put all language specific plugin specs here
        -- something like rust-tools for rust or neodev for lua
    },
    tools = {
        -- put all the mason tools here
    },
    grammars = {
        -- put all the treesitter grammars here
    }
}

function somelang.on_lspzero_setup()
    -- put your lsp configuration here
    -- this will be run *before* lspzero.setup()
end

function somelang.on_dap_setup()
    -- put you dap configuration here
end

return somelang
