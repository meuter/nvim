return {
    "terrortylor/nvim-comment",
    name = "nvim_comment",
    config = true,
    keys = {
        { "<C-_>", "<CMD>CommentToggle<CR>j",             mode = { "n" } },
        { "<C-_>", "<C-\\><C-N><CMD>CommentToggle<CR>ji", mode = { "i" } },
        { "<C-_>", ":'<,'>CommentToggle<CR>gv<esc>j",     mode = { "v" } },
    }
}
