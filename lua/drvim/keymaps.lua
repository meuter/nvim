local function noremap(mode, key, command)
    local options = {noremap=true, silent=true}
    vim.api.nvim_set_keymap(mode, key, command, options)
end

-- Ctrl+P to open file using fuzzy finder
noremap("n", "<C-p>", "<CMD>ProjectFiles<CR>")
noremap("n", "<C-p>", "<CMD>ProjectFiles<CR>")
noremap("i", "<C-p>", "<C-\\><C-N><CMD>ProjectFiles<CR>")

-- Ctrl+B to open file using fuzzy finder
noremap("n", "<C-b>", "<CMD>NeoTreeFocusToggle<CR>")
noremap("n", "<C-b>", "<CMD>NeoTreeFocusToggle<CR>")
noremap("i", "<C-b>", "<C-\\><C-N><CMD>NeoTreeFocusToggle<CR>")

-- Ctrl+/ to toggle comment
noremap("n", "<C-_>", "<CMD>CommentToggle<CR>j")
noremap("i", "<C-_>", "<C-\\><C-N><CMD>CommentToggle<CR>ji")
noremap("v", "<C-_>", ":'<,'>CommentToggle<CR>gv<esc>j")

-- Tab/Shift+tab to indent/dedent
noremap("v", "<Tab>", ">gv")
noremap("n", "<Tab>", "v><C-\\><C-N>")
noremap("v", "<S-Tab>", "<gv")
noremap("n", "<S-Tab>", "v<<C-\\><C-N>")
noremap("i", "<S-Tab>", "<C-\\><C-N>v<<C-\\><C-N>^i")

-- Alt+Up/Down to move lines around
noremap("n", "<A-Down>", ":MoveLine(1)<CR>")
noremap("n", "<A-Up>", ":MoveLine(-1)<CR>")
noremap("v", "<A-Down>", ":MoveBlock(1)<CR>")
noremap("v", "<A-Up>", ":MoveBlock(-1)<CR>")
noremap("i", "<A-Down>", "<C-\\><C-N>:MoveLine(1)<CR>i")
noremap("i", "<A-Up>", "<C-\\><C-N>:MoveLine(-1)<CR>i")

-- Ctrl+Left/Right use word boundary
noremap("n", "<C-Left>", "b")
noremap("n", "<C-Right>", "w")

-- Alt+Left/Right to navigate jumplist
noremap("n", "<A-Left>", "<C-O>")
noremap("n", "<A-Right>", "<C-I>")






