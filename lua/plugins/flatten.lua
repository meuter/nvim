return {
    "willothy/flatten.nvim",
    dependencies = {
        "akinsho/toggleterm.nvim"
    },
    lazy = false,
    priority = 1001,
    opts = {
        callbacks = {
            pre_open = function()
                require("toggleterm").toggle(0)
            end,
        }
    }
}
