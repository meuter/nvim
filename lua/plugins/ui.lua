-------------------------------------------------------------------------------
-- noice
-------------------------------------------------------------------------------
local noice = {
    "folke/noice.nvim",
    dependencies = {
        { "MunifTanjim/nui.nvim" }
    },
    config = {
        cmdline = { view = "cmdline" },
        lsp = {
            hover = { enabled = false },
            signature = { enabled = false },
        },
        messages = { view_search = false },
    }
}

-------------------------------------------------------------------------------
-- dressing
-------------------------------------------------------------------------------
local dressing = {
    "stevearc/dressing.nvim",
    config = {
        input = { border = "single" },
    }
}

-------------------------------------------------------------------------------
-- UI
-------------------------------------------------------------------------------

local winbar = {
    "fgheng/winbar.nvim",
    config = {
        enabled = true,
        colors = {
            path = "AliceBlue",
        },
        icons = {
            seperator = "❯",
        },
        exclude_filetype = {
            "gitcommit",
            "neo-tree",
            "toggleterm",
            "DiffviewFiles",
            "help",
            "Trouble",
            "qf",
        }
    }
}

-------------------------------------------------------------------------------
-- UI
-------------------------------------------------------------------------------
return {
    noice,
    dressing,
    winbar,
}
