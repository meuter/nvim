---@module 'snacks'
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
        vim.diagnostic.config({
            virtual_lines = { current_line = false },
            virtual_text = false,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.WARN] = "",
                    [vim.diagnostic.severity.HINT] = "",
                    [vim.diagnostic.severity.INFO] = ""
                },
            },
        })
        vim.api.nvim_create_autocmd("CursorHold", {
            pattern = "*",
            callback = function()
                vim.diagnostic.config({ virtual_lines = { current_line = true } })
            end,
            desc = "Enable virtual_lines with current_line",
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            pattern = "*",
            callback = function()
                vim.diagnostic.config({ virtual_lines = false })
            end,
            desc = "Disable virtual_lines",
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
