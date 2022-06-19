require("nvim_comment").setup {
    hook = function()
        if vim.api.nvim_buf_get_option(0, "filetype") == "vue" then
            require("ts_context_commentstring.internal").update_commentstring()
        end
    end
}

-- Ctrl+/ to toggle comment
vim.keymap.set("n", "<C-_>", "<CMD>CommentToggle<CR>j")
vim.keymap.set("i", "<C-_>", "<C-\\><C-N><CMD>CommentToggle<CR>ji")
vim.keymap.set("v", "<C-_>", ":'<,'>CommentToggle<CR>gv<esc>j")

