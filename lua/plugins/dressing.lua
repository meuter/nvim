return {
    "stevearc/dressing.nvim",
    opts = {
        input = { border = "single" },
        select = {
            telescope = require('telescope.themes').get_dropdown {
                previewer = false,
                borderchars = {
                    prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
                    results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
                    preview = { "─", "│", "─", "│", "╭", "╮", "┘", "└" },
                },
            }
        }
    }
}
