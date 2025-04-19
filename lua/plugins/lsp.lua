---@module 'snacks'
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.WARN] = "",
                    [vim.diagnostic.severity.HINT] = "",
                    [vim.diagnostic.severity.INFO] = ""
                },
            },
        })
        vim.filetype.add {
            pattern = {
                ["docker-compose.yaml"] = "yaml.docker-compose",
                ["docker-compose.yml"] = "yaml.docker-compose",
                ["compose.yaml"] = "yaml.docker-compose",
                ["compose.yml"] = "yaml.docker-compose",
            },
        }
        vim.lsp.enable({
            "lua_ls",
            "clangd",
            "pyright",
            "rust_analyzer",
            "bashls",
            "docker_compose_language_service",
            "dockerls",
            "neocmake",
        })
    end,
}
