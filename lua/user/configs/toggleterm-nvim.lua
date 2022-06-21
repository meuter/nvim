require("toggleterm").setup {
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_terminals = false,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "horizontal",
    close_on_exit = true,
    shell = vim.o.shell,
}

-- Map Esc and Ctrl+w in terminal mode like in normal mode
vim.api.nvim_create_autocmd("TermOpen", {
    callback = function()
        local opts = { noremap = true }
        vim.api.nvim_buf_set_keymap(0, "t", "<C-w>", [[<C-\><C-n><C-W>]], opts)
        vim.api.nvim_buf_set_keymap(0, "t", "<Esc>", [[<C-\><C-n>]], opts)
    end
})

-- When switching to terinal window, automatically enter insert mode
vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
    callback = function()
        if vim.bo.filetype == "toggleterm" then
            vim.cmd("startinsert")
        end
    end
})

