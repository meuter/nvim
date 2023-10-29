return {
    'saecki/crates.nvim',
    event = { "BufRead Cargo.toml" },
    opts = {
        loading_indicator = false
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp"
    },
    init = function()
        vim.api.nvim_create_autocmd("BufRead", {
            group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
            pattern = "Cargo.toml",
            callback = function()
                require("cmp").setup.buffer({ sources = { { name = "crates" } } })
            end,
        })
    end
}
