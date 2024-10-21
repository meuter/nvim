return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    opts = {
        -- search and command at the bottom
        cmdline = {
            view = "cmdline",
        },

        routes = {
            -- no written messages
            {
                filter = {
                    event = "msg_show",
                    kind = "",
                    find = "written",
                },
                opts = { skip = true },
            },
            -- no search virtual text
            {
                filter = {
                    event = "msg_show",
                    kind = "search_count",
                },
                opts = { skip = true },
            },
        },
    },
    init = function()
        vim.opt.cmdheight = 0
    end,
}
