return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
        "neovim/nvim-lspconfig",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
        "lukas-reineke/lsp-format.nvim",
        "MysticalDevil/inlay-hints.nvim",
    },
    config = function(_, opts)
        local lsp = require("lsp-zero").preset({
            name = "recommended",
            suggest_lsp_servers = false,
            manage_nvim_cmp = false,
        })

        lsp.on_attach(function(client, buffer)
            require("lsp-format").on_attach(client)
            require("inlay-hints").on_attach(client, bufnr)
            local keymap_opts = { noremap = true, silent = true, buffer = buffer }
            local telescope_available, _ = pcall(require, "telescope")
            if telescope_available then
                vim.keymap.set("n", "<F3>", "<cmd>Telescope lsp_references<CR>", keymap_opts)
                vim.keymap.set("n", "<F12>", "<cmd>Telescope lsp_definitions<CR>", keymap_opts)
            else
                vim.keymap.set("n", "<F3>", "<cmd>lua vim.lsp.buf.references()<CR>", keymap_opts)
                vim.keymap.set("n", "<F12>", "<cmd>lua vim.lsp.buf.definition()<CR>", keymap_opts)
            end
            vim.keymap.set("n", "<F1>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", keymap_opts)
            vim.keymap.set("n", "<S-F1>", "<cmd>lua vim.diagnostic.goto_next()<CR>", keymap_opts)
        end)

        lsp.set_sign_icons({
            error = "",
            warn = "",
            hint = "",
            info = "",
        })

        -- configured all registered LSP setup functions
        for _, setup in ipairs(opts.on_setup or {}) do
            setup(lsp)
        end
        lsp.setup()

        -- tweak lsp UI
        vim.diagnostic.config { virtual_text = true }
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
            vim.lsp.handlers.hover,
            { border = "single" }
        )
        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
            vim.lsp.handlers.signature_help,
            { border = "single" }
        )
    end,
    on_setup = function(opts, setup)
        -- this function can be called by other language specific plugins
        -- to register a setup function that will be called before lsp-zero's
        -- setup() function.
        opts.on_setup = opts.on_setup or {}
        table.insert(opts.on_setup, setup)
    end
}
