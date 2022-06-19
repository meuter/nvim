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

local function project_files()
    local opts = {}
    local ok, telescope_builtin = pcall(require, "telescope.builtin")
    if not ok then return end

    local git_files_ok = pcall(telescope_builtin.git_files, opts)
    if not git_files_ok then
        telescope_builtin.find_files(opts)
    end
end

-- Commands
vim.api.nvim_create_user_command("ProjectFiles", project_files, { desc="Find Project File" })

-- Ctrl+P to open project files using fuzzy finder
vim.keymap.set("n", "<C-p>", "<CMD>ProjectFiles<CR>")
vim.keymap.set("n", "<C-p>", "<CMD>ProjectFiles<CR>")
vim.keymap.set("i", "<C-p>", "<C-\\><C-N><CMD>ProjectFiles<CR>")
