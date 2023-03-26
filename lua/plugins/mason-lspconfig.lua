return {
    "williamboman/mason-lspconfig.nvim",
    config = function()
        require("mason-lspconfig").setup {
            ensure_installed = {
                "bashls",
                "cssls",
                "clangd",
                "neocmake",
                "dockerls",
                "docker_compose_language_service",
                "gopls",
                "emmet_ls",
                "html",
                "jsonls",
                "lua_ls",
                "marksman",
                "pyright",
                "ruff_lsp",
                "taplo",
                "rust_analyzer",
                "tsserver",
                "yamlls"
            }
        }
    end
}
