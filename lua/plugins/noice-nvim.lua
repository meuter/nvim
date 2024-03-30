return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        -- search and command at the bottom
        cmdline = {
            view = "cmdline"
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
    dependencies = {
        "MunifTanjim/nui.nvim",
    }
}
