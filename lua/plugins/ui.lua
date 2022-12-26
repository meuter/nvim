local noice = {
    "folke/noice.nvim",
    dependencies = {
        { "MunifTanjim/nui.nvim" }
    }
}

function noice.config()
    require("noice").setup {
        cmdline = { view = "cmdline" },
        lsp = {
            hover = { enabled = false },
            signature = { enabled = false },
        },
        messages = { view_search = false },
    }
end

local dressing = {
    "stevearc/dressing.nvim",
}

function dressing.config()
    require("dressing").setup {
        input = {
            border = "single",
        },
    }
end

return {
    noice,
    dressing
}
