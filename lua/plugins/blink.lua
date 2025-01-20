return {
    "saghen/blink.cmp",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    version = "*",
    build = "cargo build --release",
    opts = {
        -- "default" for mappings similar to built-in completion
        -- "super-tab" for mappings similar to vscode (tab to accept, arrow keys to navigate)
        -- "enter" for mappings similar to "super-tab" but with "enter" to accept
        -- See the full "keymap" documentation for information on defining your own keymap.
        keymap = {
            preset = "enter"
        },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono"
        },

        completion = {
            list = {
                selection = {
                    preselect = function(ctx) return ctx.mode ~= 'cmdline' end,
                    auto_insert = function(ctx) return ctx.mode ~= 'cmdline' end
                }
            },
            menu = {
                auto_show = function(ctx)
                    return ctx.mode ~= "cmdline" or not vim.tbl_contains({ '/', '?' }, vim.fn.getcmdtype())
                end,
            }
        },

        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
            min_keyword_length = function(ctx)
                if ctx.mode == 'cmdline' and string.find(ctx.line, ' ') == nil then
                    return 3
                end
                return 2
            end
        },
    },
    opts_extend = { "sources.default" }
}
