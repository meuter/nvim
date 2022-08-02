require("onenord").setup {
    theme = "dark", -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
    borders = true, -- Split window borders
    fade_nc = false, -- Fade non-current windows, making them more distinguishable
    -- Style that is applied to various groups: see `highlight-args` for options
    styles = {
        comments = "NONE",
        strings = "NONE",
        keywords = "NONE",
        functions = "NONE",
        variables = "NONE",
        diagnostics = "NONE"
    },
    disable = {
        background = false, -- Disable setting the background color
        cursorline = false, -- Disable the cursorline
        eob_lines = true, -- Hide the end-of-buffer lines
    },
    -- Inverse highlight for different groups
    inverse = {
        match_paren = true,
    },
    custom_highlights = {}, -- Overwrite default highlight groups
    custom_colors = { -- Overwrite default colors
        bg = "#252525",
        -- orange = "#D08F70",
        orange = "#EA8570",
        yellow = "#EBCB8B",
    }
}
