---@module 'snacks'
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        { "j-hui/fidget.nvim",   opts = {} },
        { "mrcjkb/rustaceanvim", version = '^5', lazy = false }
    },
    config = function()
        require("lspconfig.ui.windows").default_options = { border = "single" }

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
            callback = function(event)
                local map = function(keys, func, desc, mode)
                    mode = mode or "n"
                    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                end

                map("gd", function() Snacks.picker.lsp_definitions() end, "Goto Definition")
                map("gr", function() Snacks.picker.lsp_references() end, "Goto Definition")
                map("gD", function() Snacks.picker.lsp_declarations() end, "Goto Declaration")
                map("gI", function() Snacks.picker.lsp_implementations() end, "Goto Implementation")
                map("grn", vim.lsp.buf.rename, "Rename")
                map("gca", vim.lsp.buf.code_action, "Code Action", { "n", "x" })
                map("gs", function() Snacks.picker.lsp_symbols() end, "Document Symbols")
                map("gS", function() Snacks.picker.lsp_workspace_symbols() end, "Workspace Symbols")
                map("gt", function() Snacks.picker.diagnostics() end, "Diagnostics")

                map("<A-i>", function()
                    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
                end, "Toggle Inlay Hints")
            end,
        })

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

        local servers = {
            bashls = {},
            clangd = {
                settings = {
                    clangd = {
                        InlayHints = {
                            Designators = true,
                            Enabled = true,
                            ParameterNames = true,
                            DeducedTypes = true,
                        },
                    },
                    fallbackFlags = { "-std=c++20" },
                },
                cmd = {
                    "clangd",
                    "-j=4",
                    "--clang-tidy",
                    "--background-index",
                    "--header-insertion=never",
                    "--fallback-style=webkit",
                    "--all-scopes-completion",
                    "--completion-style=detailed",
                    "--pch-storage=memory",
                },
            },
            docker_compose_language_service = {},
            dockerls = {},
            lua_ls = {
                settings = {
                    Lua = {
                        completion = { callSnippet = "Replace" },
                        diagnostics = { globals = { "vim" } },
                        telemetry = { enable = false },
                        workspace = { checkThirdParty = false },
                        hint = { enable = true },
                    },
                },
            },
            neocmake = {
                cmd = { "neocmakelsp", "--stdio" },
            },
            pyright = {},
            rust_analyzer = {},
            glsl_analyzer = {},
            zls = {},
        }

        local ensure_installed = vim.tbl_keys(servers or {})

        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = ensure_installed,
            automatic_installation = true,
            handlers = {
                function(server_name)
                    if server_name == "rust_analyzer" then
                        return -- already done by rustaceans
                    end
                    local server = servers[server_name] or {}
                    server.capabilities = require('blink.cmp').get_lsp_capabilities(server.capabilities)
                    require("lspconfig")[server_name].setup(server)
                end,
            },
        })
    end,
}
