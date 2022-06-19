local function map(mode, key, command)
    local options = {noremap=true, silent=true}
    return vim.api.nvim_set_keymap(mode, key, command, options)
end

local function map_all_modes(key, command)
    map("n", key, command)
    map("i", key, "<C-\\><C-N>" .. command)
    map("v", key, "<C-\\><C-N>" .. command)
end

-- ctrl+p to open file
map_all_modes("<C-p>", "<CMD>ProjectFiles<CR>")


-- ctrl+shift+/ to toggle comment
map("n", "<C-_>", "<CMD>CommentToggle<CR>j")
map("i", "<C-_>", "<C-\\><C-N><CMD>CommentToggle<CR>ji")
map("v", "<C-_>", ":'<,'>CommentToggle<CR>gv<esc>j")

