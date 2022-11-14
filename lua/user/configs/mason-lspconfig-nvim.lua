local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

local extra_config = {
    ["clangd"] = {
        cmd = {
            "clangd",
            "-j=4",
            "--clang-tidy",
            "--background-index",
            "--suggest-missing-includes",
            "--header-insertion=never",
            "--fallback-style=webkit",
            "--all-scopes-completion",
            "--completion-style=detailed",
            "--pch-storage=memory",
        }
    },
    ["jsonls"] = {
        settings = {
            json = {
                schemas = require('schemastore').json.schemas(),
                validate = { enable = true },
            },
        }
    },
    ["sumneko_lua"] = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                    disable = {}
                },
                telemetry = {
                    enable = false,
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
        }
    },
}

local function common_capabilities()
    local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if status_ok then
        return cmp_nvim_lsp.default_capabilities()
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    }

    return capabilities
end

local function on_attach(_, buffer)
    local opts = { noremap = true, silent = true, buffer = buffer }
    local telescope_available, _ = pcall(require, "telescope")
    if telescope_available then
        vim.keymap.set("n", "<F3>", "<cmd>Telescope lsp_references<CR>", opts)
        vim.keymap.set("n", "<F12>", "<cmd>Telescope lsp_definitions<CR>", opts)
    else
        vim.keymap.set("n", "<F3>", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
        vim.keymap.set("n", "<F12>", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    end
    vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

    vim.keymap.set("n", "<F1>", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.keymap.set("n", "<F4>", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
end

mason_lspconfig.setup()
mason_lspconfig.setup_handlers {
    function(server_name)
        local common_options = {
            capabilities = common_capabilities(),
            on_attach = on_attach
        }
        local extra_options = extra_config[server_name] or {}
        local server_options = vim.tbl_deep_extend("force", common_options, extra_options)
        lspconfig[server_name].setup(server_options)
    end
}

