
require("bufferline").setup {
    options = {
        offsets = {
            { filetype = "NvimTree", text = "File Explorer", highlight = "PanelHeading", padding = 1, },
            { filetype = "DiffviewFiles", text = "Diff View", highlight = "PanelHeading", padding = 1, },
            { filetype = "packer", text = "Packer", highlight = "PanelHeading", padding = 1, },
            { filetype = "neo-tree", text = "File Explorer", highlight = "PanelHeading", padding = 1 },
            { filetype = "Outline", text = "Outline", highlight = "PanelHeading", padding = 1 },
        },
        middle_mouse_command = "bdelete! %d",
        right_mouse_command = nil,
        indicator_icon = "",
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 30,
        max_prefix_length = 30,
        tab_size = 21,
        diagnostics = false,
        diagnostics_update_in_insert = false,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = "thin",
        enforce_regular_tabs = true,
        always_show_bufferline = true,
    },
    highlights = {
        background = { gui = "NONE", guifg = "grey" },
        close_button = { gui = "NONE", guifg = "grey" },
        close_button_visible = { gui = "NONE", guifg = "grey" },
        buffer_selected = { gui = "bold", guifg = "white" },
        buffer_visible = { gui = "NONE", guifg = "grey" },
    }
}

