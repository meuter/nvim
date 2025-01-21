return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        { "j-hui/fidget.nvim",   opts = {} },
        "hrsh7th/cmp-nvim-lsp",
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

                map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
                map("<F12>", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

                map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
                map("<F3>", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

                map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
                map("<F4>", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })

                map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
                map("<F2>", vim.lsp.buf.rename, "[R]e[n]ame")

                map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
                map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
                map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
                map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
                map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

                map("<A-i>", function()
                    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
                end, "Toggle Inlay Hints")
            end,
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

        local signs = { Error = "", Warn = "", Hint = "", Info = "" }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end


        local servers = {
            bashls = {
                wincmd = "bash-language-server/node_modules/.bin/bash-language-server"
            },
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
                wincmd = "clangd/clangd_19.1.2/bin/clangd.exe",
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
                wincmd = "lua-language-server/bin/lua-language-server.exe",
            },
            neocmake = {
                cmd = { "neocmakelsp", "--stdio" },
                wincmd = "neocmakelsp/bin/neocmakelsp.exe"
            },
            pyright = {},
            rust_analyzer = {},
            glsl_analyzer = {
                wincmd = "glsl_analyzer/bin/glsl_analyzer.exe"
            },
        }

        local ensure_installed = vim.tbl_keys(servers or {})
        local is_windows = vim.fn.has("win32") or vim.fn.has("win64")

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

                    if is_windows ~= 0 and server.wincmd ~= nil then
                        -- NOTE: on windows, mason tries to run CMD script but that does not work
                        --       on powershell. Need to hack the path to the underlying binary.
                        local lsp_bin = vim.fn.stdpath("data") .. "/mason/packages/" .. server.wincmd
                        if server.cmd == nil then
                            server.cmd = { lsp_bin }
                        else
                            server.cmd[1] = lsp_bin
                        end
                    end

                    server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                    require("lspconfig")[server_name].setup(server)
                end,
            },
        })
    end,
}
