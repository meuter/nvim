return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup {
            color_overrides = {
                all = {
                    text = "#dddddd",
                    base = "#1A1A1A",
                    mantle = "#121212",
                },
            },
            no_italic = true,
            no_bold = true,
            no_underline = true,
            integrations = {
                neotree = true,
                mason = true,
                cmp = true,
                dap = true,
                dap_ui = true,
                gitsigns = true,
                treesitter = true,
                rainbow_delimiters = true,
                lsp_trouble = true,
                telescope = {
                    enabled = true,
                },
                indent_blankline = {
                    enabled = true,
                    scope_color = "surface1",
                    colored_indent_levels = true,
                },
                barbecue = {
                    dim_dirname = true,
                    bold_basename = true,
                    dim_context = false,
                    alt_background = false,
                },
                fidget = true,
            }
        }
        vim.cmd.colorscheme("catppuccin-mocha")

        vim.cmd [[
            " folders are blue by default with catppuccin-mocha, override after scheme is loaded
            hi NeoTreeDirectoryName guifg=#ffffff guibg=NONE gui=bold cterm=bold
            hi NeoTreeRootName guifg=#ffffff guibg=NONE gui=bold cterm=bold

            " reset vertical split line
            hi VertSplit guifg=NONE guibg=NONE gui=NONE cterm=NONE

            " selection color: let syntax hl in fg + modified background
            hi Visual guifg=NONE guibg=#253747 gui=NONE cterm=NONE
            hi PmenuSel guifg=NONE guibg=#253747 gui=NONE cterm=NONE
        ]]
    end
}
