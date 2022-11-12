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
local telescope_themes = require('telescope.themes')
local edits = require("user.utils.edits")

local function search_todo()
    telescope_builtin.grep_string { search="todo(cme)" }
end

local function navigate_directory()
    local actions = require('telescope.actions')
    local config  = require('telescope.config').values
    local pickers = require('telescope.pickers')
    local finders = require('telescope.finders')
    local actions_state = require('telescope.actions.state')
    local from_entry = require('telescope.from_entry')

    local cmd = { "bfs", os.getenv("HOME"), "-type", "d",
        "-exclude", "-name", ".npm",
        "-exclude", "-name", ".gradle",
        "-exclude", "-name", ".vscode-server",
        "-exclude", "-name", ".cache",
        "-exclude", "-name", ".git",
        "-exclude", "-name", ".repo",
        "-exclude", "-name", "node_modules",
    }

    local opts = {}

    pickers.new(opts, {
        prompt_title = "Navigate",
        finder = finders.new_oneshot_job(cmd),
        sorter = config.file_sorter(opts),
        previewer = config.file_previewer(opts),
        attach_mappings = function(prompt_bufnr)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local entry = actions_state.get_selected_entry()
                local dir = from_entry.path(entry)
                vim.cmd('cd '..dir)
            end)
            return true
        end,
    }):find()
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

local function search_function()
    local opts = telescope_themes.get_dropdown({
        symbols = {
            "function",
            "method",
        },
    })
    telescope_builtin.lsp_document_symbols(opts)
end

-- Commands
vim.api.nvim_create_user_command("Todo", search_todo, { desc="Search for TODO(cme)" })
vim.api.nvim_create_user_command("NavigateDirectory", navigate_directory, { desc="Navigate Directory"})
vim.api.nvim_create_user_command("SearchWordUnderCursor", search_word_under_cursor, { desc="Search Word Under the Cursor"})
vim.api.nvim_create_user_command("SearchSelectedText", search_selected_text, { desc="Search Selected Text"})
vim.api.nvim_create_user_command("SearchFunction", search_function, { desc="Search Function"})
vim.api.nvim_create_user_command("GitHistory", 'Telescope git_commits', {desc="Search Git History"})
vim.api.nvim_create_user_command("GitFileHistory", 'Telescope git_bcommits', {desc="Search Git File History"})
vim.api.nvim_create_user_command("GitBranch", 'Telescope git_branches', {desc="Search Git Branches"})
vim.api.nvim_create_user_command("GitStatus", 'Telescope git_status', {desc="Search Git Status"})

local opts = { noremap = true, silent = true }

-- Ctrl+p to open project files using fuzzy finder
vim.keymap.set("n", "<C-p>", "<CMD>Telescope find_files<CR>", opts)
vim.keymap.set("v", "<C-p>", "<CMD>Telescope find_files<CR>", opts)
vim.keymap.set("i", "<C-p>", "<C-\\><C-n><CMD>Telescope find_files<CR>", opts)

-- Ctrl+s to search word under the cursor/selected text
vim.keymap.set("n", "<C-s>", "<CMD>SearchWordUnderCursor<CR>", opts)
vim.keymap.set("v", "<C-s>", "<ESC><CMD>SearchSelectedText<CR>", opts)

-- Ctrl+l to live_grep
vim.keymap.set("n", "<C-l>", "<CMD>Telescope live_grep<CR>", opts)
vim.keymap.set("v", "<C-l>", "<CMD>Telescope live_grep<CR>", opts)
vim.keymap.set("i", "<C-l>", "<C-\\><C-n><CMD>Telescope live_grep<CR>", opts)

-- Ctrl+n to navigate
vim.keymap.set("n", "<C-n>", "<CMD>NavigateDirectory<CR>", opts)
vim.keymap.set("v", "<C-n>", "<CMD>NavigateDirectory<CR>", opts)
vim.keymap.set("i", "<C-n>", "<C-\\><C-n><CMD>NavigateDirectory<CR>", opts)

-- \\ to switch buffer
vim.keymap.set("n", "<Bslash><Bslash>", "<CMD>Telescope buffers<CR>", opts)
vim.keymap.set("v", "<Bslash><Bslash>", "<CMD>Telescope buffers<CR>", opts)

-- Ctrl+o to go to symbol
vim.keymap.set("n", "<C-o>", "<CMD>Telescope lsp_workspace_symbols<CR>", opts)
vim.keymap.set("v", "<C-o>", "<CMD>Telescope lsp_workspace_symbols<CR>", opts)
vim.keymap.set("i", "<C-o>", "<C-\\><C-n><CMD>Telescope lsp_workspace_symbols<CR>", opts)

-- Ctrl+t to open telescope
vim.keymap.set("n", "<C-t>", "<CMD>Telescope<CR>", opts)
vim.keymap.set("v", "<C-t>", "<CMD>Telescope<CR>", opts)
vim.keymap.set("v", "<C-t>", "<C-\\><C-n><CMD>Telescope<CR>", opts)



