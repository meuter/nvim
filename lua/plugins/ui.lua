-------------------------------------------------------------------------------
-- noice
-------------------------------------------------------------------------------
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
return {
    noice,
    dressing
}
