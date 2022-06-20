return {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
                disable = {}
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp/")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
        },
    },
}
