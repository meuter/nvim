-------------------------------------------------------------------------------
-- telescope
-------------------------------------------------------------------------------
local function search_selected_text()
    vim.cmd([[ noau normal! "vy" ]])
    local selected = string.gsub(vim.fn.getreg("v"), "\n", "")
    require("telescope.builtin").grep_string({ search = selected })
end

local telescope = {
    "nvim-telescope/telescope.nvim",
    keys = {
        { "<C-t>", "<CMD>Telescope<CR>", mode = { "n", "v", "i" } },
        { "<C-p>", "<CMD>Telescope find_files<CR>", mode = { "n", "v", "i" } },
        { "<C-l>", "<CMD>Telescope live_grep<CR>", mode = { "n", "v", "i" } },
        { "<C-o>", "<CMD>Telescope lsp_document_symbols<CR>", mode = { "n", "v", "i" } },
        { "<C-h>", "<CMD>Telescope help_tags<CR>", mode = { "n", "v", "i" } },
        { "<C-c>", "<CMD>Telescope commands<CR>", mode = { "n", "v", "i" } },
        { "<C-k>", "<CMD>Telescope keymaps<CR>", mode = { "n", "v", "i" } },
        { "<C-s>", "<CMD>Telescope grep_string<CR>", mode = { "n", "i" } },
        { "<C-s>", search_selected_text, mode = { "v" } }
    },
    cmd = {
        "Telescope",
        "GitHistory"
    },
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    }
}

function telescope.init()
    vim.api.nvim_create_user_command("GitHistory", function()
        local previewers = require('telescope.previewers')
        local builtin    = require('telescope.builtin')
        local delta      = previewers.new_termopen_previewer {
            get_command = function(entry)
                return {
                    'git',
                    '-c', 'core.pager=delta',
                    '-c', 'delta.side-by-side=false',
                    'diff', entry.value .. '^!', '--',
                    entry.current_file
                }
            end
        }
        builtin.git_commits {
            previewer = {
                delta,
                previewers.git_commit_message.new({}),
                previewers.git_commit_diff_as_was.new({}),
            }
        }
    end, {})
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
