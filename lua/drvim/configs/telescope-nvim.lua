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

local function project_files()
    local git_files_ok = pcall(telescope_builtin.git_files, {})
    if not git_files_ok then
        telescope_builtin.find_files({})
    end
end

local function search_todo()
    telescope_builtin.grep_string { search="todo(cme)" }
end

-- TODO(cme): navigate directory
-- TODO(cme): live search + search file under cursor

-- Commands
vim.api.nvim_create_user_command("ProjectFiles", project_files, { desc="Find Project File" })
vim.api.nvim_create_user_command("Todo", search_todo, { desc="Search for TODO(cme)" })

-- Ctrl+P to open project files using fuzzy finder
vim.keymap.set("n", "<C-p>", "<CMD>ProjectFiles<CR>")
vim.keymap.set("n", "<C-p>", "<CMD>ProjectFiles<CR>")
vim.keymap.set("i", "<C-p>", "<C-\\><C-N><CMD>ProjectFiles<CR>")
