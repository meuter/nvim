return {
    "stevearc/dressing.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        require("dressing").setup {
            input = { border = "single" },
            select = {
                telescope = require('telescope.themes').get_dropdown {
                    previewer = false,
                    borderchars = {
                        prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
                        results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
                        preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                    },
                }
            }
        }
    end
}
