return {
    "saghen/blink.cmp",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    version = "*",
    build = "cargo build --release",
    opts = {
        keymap = {
            preset = "none",
            ["<S-Esc>"] = { "hide", "fallback_to_mappings" },
            ["<CR>"] = { "accept", "fallback" },
            ["<Tab>"] = { "select_next", "fallback" },
            ["<S-Tab>"] = { "select_prev", "fallback" },
            ["<Up>"] = { "select_prev", "fallback" },
            ["<Down>"] = { "select_next", "fallback" },
        },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono"
        },

        completion = {
            list = {
                selection = {
                    preselect = false,
                    auto_insert = false
                }
            },
            menu = {
                auto_show = function(ctx)
                    return ctx.mode ~= "cmdline" or not vim.tbl_contains({ "/", "?" }, vim.fn.getcmdtype())
                end,
            }
        },

        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
            min_keyword_length = function(ctx)
                if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then
                    return 3
                end
                return 0
            end
        },
    },
    opts_extend = { "sources.default" }
}
