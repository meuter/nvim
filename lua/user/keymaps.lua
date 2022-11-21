-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

-- Tab/Shift+tab to indent/dedent
map("v", "<Tab>", ">gv")
map("n", "<Tab>", "v><C-\\><C-N>")
map("v", "<S-Tab>", "<gv")
map("n", "<S-Tab>", "v<<C-\\><C-N>")
map("i", "<S-Tab>", "<C-\\><C-N>v<<C-\\><C-N>^i")

-- Ctrl+Left/Right use word boundary
map("n", "<C-Left>", "b")
map("n", "<C-Right>", "w")

-- Alt+Left/Right to navigate jumplist
map("n", "<A-Left>", "<C-O>")
map("n", "<A-Right>", "<C-I>")

-- Ctrl+w in insert mode automatically escpaces
map("i", "<C-w>", "<C-\\><C-N><C-w>")

-- dismiss search highlight with esc x 3
map("n", "<esc>", "<CMD>nohl<CR><esc>")
map("v", "<esc>", "<CMD>nohl<CR><esc>")

