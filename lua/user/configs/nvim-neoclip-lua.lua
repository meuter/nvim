require("telescope").load_extension("neoclip")
require("neoclip").setup {
    keys = {
        telescope = {
            i = {
                paste = '<cr>',
            },
            n = {
                paste = '<cr>',
            },
        },
    }
}
