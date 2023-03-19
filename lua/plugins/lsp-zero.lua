return {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
        "lukas-reineke/lsp-format.nvim",
        "onsails/lspkind.nvim",
    },
    config = function()
        local lsp = require("lsp-zero")
        lsp.preset("recommended")
        lsp.set_preferences {
            sign_icons = {
                error = "",
                warn = "",
                hint = "",
                info = "",
            },
        }
        lsp.on_attach(function(client, buffer)
            require("lsp-format").on_attach(client)
            local opts = { noremap = true, silent = true, buffer = buffer }
            local telescope_available, _ = pcall(require, "telescope")
            if telescope_available then
                vim.keymap.set("n", "<F3>", "<cmd>Telescope lsp_references<CR>", opts)
                vim.keymap.set("n", "<F12>", "<cmd>Telescope lsp_definitions<CR>", opts)
            else
                vim.keymap.set("n", "<F3>", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
                vim.keymap.set("n", "<F12>", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
            end
            vim.keymap.set("n", "<F1>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
            vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
        end)

        lsp.nvim_workspace()
        lsp.setup()

        -- override nvim-cmp configuration
        local cmp = require("cmp")
        cmp.setup(lsp.defaults.cmp_config {
            completion = {
                completeopt = "menu,menuone,noselect,noinsert"
            },
            window = {
                completion = { border = "single" },
                documentation = { border = "single" },
            },
            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = require("lspkind").cmp_format({
                    mode = "symbol",
                    maxwidth = 50,
                    ellipsis_char = "...",
                }),
            },
        })
        cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer", keyword_length = 3 },
            },
        })
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "path",    keyword_length = 3 },
                { name = "cmdline", keyword_length = 3 },
            },
        })

        vim.diagnostic.config { virtual_text = true }
    end
}
