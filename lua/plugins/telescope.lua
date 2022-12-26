local telescope = {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    }
}

function telescope.init()
    -- Ctrl+p to open project files using fuzzy finder
    vim.keymap.set({ "n", "v" }, "<C-p>", "<CMD>Telescope find_files<CR>")
    vim.keymap.set("i", "<C-p>", "<C-\\><C-n><CMD>Telescope find_files<CR>")

    -- Ctrl+l to live_grep
    vim.keymap.set({ "n", "v" }, "<C-l>", "<CMD>Telescope live_grep<CR>")
    vim.keymap.set("i", "<C-l>", "<C-\\><C-n><CMD>Telescope live_grep<CR>")

    -- Ctrl+o to go to symbol
    vim.keymap.set({ "n", "v" }, "<C-o>", "<CMD>Telescope lsp_document_symbols<CR>")
    vim.keymap.set("i", "<C-o>", "<C-\\><C-n><CMD>Telescope lsp_document_symbols<CR>")

    -- Ctrl+h to open help page
    vim.keymap.set({ "n", "v" }, "<C-h>", "<CMD>Telescope help_tags<CR>")
    vim.keymap.set("i", "<C-h>", "<C-\\><C-n><CMD>Telescope help_tags<CR>")

    -- Ctrl+k to open commands
    vim.keymap.set({ "n", "v" }, "<C-k>", "<CMD>Telescope commands<CR>")
    vim.keymap.set("i", "<C-k>", "<C-\\><C-n><CMD>Telescope commands<CR>")

    -- Ctrl+t to open telescope
    vim.keymap.set({ "n", "v" }, "<C-t>", "<CMD>Telescope<CR>")
    vim.keymap.set("v", "<C-t>", "<C-\\><C-n><CMD>Telescope<CR>")

    -- Ctrl+f to search word under the cursor/selected text
    vim.keymap.set("n", "<C-s>", "<CMD>Telescope grep_string<CR>")
    vim.keymap.set("v", "<C-s>", function()
        vim.cmd([[ noau normal! "vy" ]])
        local selected = string.gsub(vim.fn.getreg("v"), "\n", "")
        require("telescope.builtin").grep_string({ search = selected })
    end)
end

function telescope.config()
    require("telescope").setup {
        defaults = {
            prompt_prefix = "🔎 ",
            color_devicons = true,
            selection_caret = "❯ ",
            preview = {
                treesitter = true,
            },
            borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        },
    }
    require("telescope").load_extension("fzf")
end

return telescope
