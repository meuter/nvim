return {
    "williamboman/mason.nvim",
    config = function()
        require("mason").setup {
            ui = {
                border = "single"
            }
        }
        -- require("mason.api.command").MasonInstall {
        --     "bash-language-server",
        --     "clangd",
        --     "cmake-language-server",
        --     "codelldb",
        --     "dockerfile-language-server",
        --     "gopls",
        --     "delve",
        --     "json-lsp",
        --     "lua-language-server",
        --     "marksman",
        --     "pyright",
        --     "black",
        --     "debugpy",
        --     "rust-analyzer",
        --     "codelldb",
        --     "taplo",
        --     "typescript-language-server",
        --     "eslint-lsp",
        --     "html-lsp",
        --     "emmet-ls",
        --     "css-lsp",
        --     "yaml-language-server"
        -- }
    end
}
