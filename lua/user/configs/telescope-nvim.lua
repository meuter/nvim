require("telescope").setup {
    pickers = {
        buffers = {
            theme = "dropdown",
            previewer = false
        }
    },
    defaults = {
        prompt_prefix = "🔎 ",
        color_devicons = true,
        selection_caret = "❯ ",
        preview = {
            treesitter = false,
        },
    },
}

local telescope_builtin = require("telescope.builtin")
local edits = require("user.utils.edits")

local function search_todo()
    telescope_builtin.grep_string { search = "todo(cme)" }
end

local function search_word_under_cursor()
    telescope_builtin.grep_string {
        search=edits.get_word_under_cursor()
    }
end

local function search_selected_text()
    telescope_builtin.grep_string {
        search=edits.get_selected_text()
    }
end


-- Commands
vim.api.nvim_create_user_command("Todo", search_todo, { desc = "Search for TODO(cme)" })
vim.api.nvim_create_user_command("SearchWordUnderCursor", search_word_under_cursor, { desc="Search Word Under the Cursor"})
vim.api.nvim_create_user_command("SearchSelectedText", search_selected_text, { desc="Search Selected Text"})
vim.api.nvim_create_user_command("GitHistory", 'Telescope git_commits', { desc = "Search Git History" })
vim.api.nvim_create_user_command("GitFileHistory", 'Telescope git_bcommits', { desc = "Search Git File History" })
vim.api.nvim_create_user_command("GitBranch", 'Telescope git_branches', { desc = "Search Git Branches" })
vim.api.nvim_create_user_command("GitStatus", 'Telescope git_status', { desc = "Search Git Status" })

-- Ctrl+p to open project files using fuzzy finder
vim.keymap.set({ "n", "v" }, "<C-p>", "<CMD>Telescope find_files<CR>")
vim.keymap.set("i", "<C-p>", "<C-\\><C-n><CMD>Telescope find_files<CR>")

-- Ctrl+s to search word under the cursor/selected text
vim.keymap.set("n", "<C-s>", "<CMD>SearchWordUnderCursor<CR>")
vim.keymap.set("v", "<C-s>", "<ESC><CMD>SearchSelectedText<CR>")

-- Ctrl+l to live_grep
vim.keymap.set({ "n", "v" }, "<C-l>", "<CMD>Telescope live_grep<CR>")
vim.keymap.set("i", "<C-l>", "<C-\\><C-n><CMD>Telescope live_grep<CR>")

-- \\ to switch buffer
vim.keymap.set({ "n", "v" }, "<Bslash><Bslash>", "<CMD>Telescope buffers<CR>")

-- Ctrl+o to go to symbol
vim.keymap.set({ "n", "v" }, "<C-o>", "<CMD>Telescope lsp_document_symbols<CR>")
vim.keymap.set("i", "<C-o>", "<C-\\><C-n><CMD>Telescope lsp_document_symbols<CR>")

-- Ctrl+t to open telescope
vim.keymap.set({ "n", "v" }, "<C-t>", "<CMD>Telescope<CR>")
vim.keymap.set("v", "<C-t>", "<C-\\><C-n><CMD>Telescope<CR>")
