return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
        "onsails/lspkind.nvim",
    },
    config = function()
        local cmp = require("cmp")
        cmp.setup({
            sources = {
                { name = "path" },
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "luasnip" },
            },
            mapping = {
                ['<CR>'] = cmp.mapping.confirm { select = false },
                ['<Up>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
                ['<Down>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            },
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
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
    end
}
