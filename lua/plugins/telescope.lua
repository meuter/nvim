return {
    "nvim-telescope/telescope.nvim",
    keys = {
        { "<C-t>", "<CMD>Telescope<CR>",                                                       mode = { "n", "v", "i" } },
        { "<C-p>", "<CMD>Telescope find_files<CR>",                                            mode = { "n", "v", "i" } },
        { "<A-d>", "<CMD>Telescope diagnostics<CR>",                                           mode = { "n", "v", "i" } },
        { "<A-p>", "<CMD>Telescope buffers<CR>",                                               mode = { "n", "v", "i" } },
        { "<C-l>", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", mode = { "n", "v", "i" } },
        { "<C-o>", "<CMD>Telescope lsp_document_symbols<CR>",                                  mode = { "n", "v", "i" } },
        { "<C-s>", "<CMD>Telescope grep_string<CR>",                                           mode = { "n", "i" } },
    },
    cmd = {
        "Telescope",
    },
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim",    build = "make" },
        { "nvim-telescope/telescope-live-grep-args.nvim" },
        { "nvim-telescope/telescope-dap.nvim" },
    },
    config = function()
        local telescope = require("telescope")
        local lga_actions = require("telescope-live-grep-args.actions")

        telescope.setup {
            defaults = {
                prompt_prefix = "🔎 ",
                color_devicons = true,
                selection_caret = "❯ ",
                preview = {
                    treesitter = true,
                },
                borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
            },
            pickers = {
                colorscheme = {
                    enable_preview = true,
                },
                buffers = {
                    theme = "dropdown",
                    previewer = false,
                    borderchars = {
                        prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
                        results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
                        preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                    },
                }
            },
            extensions = {
                live_grep_args = {
                    auto_quoting = true,
                    mappings = {
                        i = {
                            ["<C-k>"] = lga_actions.quote_prompt(),
                            ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                        },
                    },
                }
            }
        }
        telescope.load_extension("fzf")
        telescope.load_extension("live_grep_args")
        telescope.load_extension("dap")
    end
}
