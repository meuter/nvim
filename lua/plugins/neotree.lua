local function close_vim_fugitive_window()
    for _, window in ipairs(vim.api.nvim_list_wins()) do
        local buffer = vim.api.nvim_win_get_buf(window)
        local buffer_name = vim.api.nvim_buf_get_name(buffer)
        if buffer_name:find("fugitive:", 1, true) then
            vim.api.nvim_win_close(window, false)
        end
    end
end

local function is_windows()
    local result = (vim.fn.has("win32") == 1) or (vim.fn.has("win64") == 1)
    return result
end



return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        "tpope/vim-fugitive",
        "famiu/bufdelete.nvim"
    },
    cmd = {
        "Neotree"
    },
    keys = {
        { "<C-b>", "<CMD>Neotree source=filesystem action=focus position=left<CR>", mode = { "n", "v", "i" } },
        { "<C-g>", "<CMD>Neotree source=git_status action=focus position=left<CR>", mode = { "n", "v", "i" } },
    },
    main = "neo-tree",
    init = function()
        vim.api.nvim_create_autocmd('FileType', {
            pattern = { "gitcommit" },
            callback = function(opts)
                vim.keymap.set("n", "<C-c><C-c>", ":w<CR>:Bd<CR>", { buffer = opts.buf })
                vim.keymap.set("i", "<C-c><C-c>", "<C-\\><C-n>:w<CR>:Bd<CR>", { buffer = opts.buf })
            end,
            group = vim.api.nvim_create_augroup("git-commit-keymap", { clear = true })
        })
    end,
    opts = {
        use_libuv_file_watcher = (not is_windows()),
        open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
        git_status_async = false,
        close_if_last_window = true,
        popup_border_style = "single",
        enable_diagnostics = false,
        enable_git_status = false,
        window = {
            mappings = {
                ["c"] = nil,
            }
        },
        git_status = {
            window = {
                width = 30,
                mappings = {
                    ["<CR>"]  = "preview_diff",
                    ["D"]     = "open_diff",
                    ["o"]     = "open_custom",
                    ["<tab>"] = "preview_file",
                    ["<C-g>"] = "close_window",
                    ["<C-b>"] = "switch_to_filesystem",
                    ["S"]     = "git_add_all",
                    ["U"]     = "git_unstage_all",
                    ["s"]     = "git_add_file",
                    ["u"]     = "git_unstage_file",
                    ["X"]     = "git_revert_file",
                    ["cc"]    = { "git_commit_custom", config = { amend = false } },
                    ["ca"]    = { "git_commit_custom", config = { amend = true } },
                    ["c"]     = "noop",
                    ["A"]     = "noop",
                }
            },
        },
        filesystem = {
            window = {
                width = 30,
                mappings = {
                    ["<F5>"] = "refresh",
                    ["<F2>"] = "rename",
                    ["D"] = "open_diff",
                    ["<C-b>"] = "close_window",
                },
            },
            filtered_items = {
                visible = false,
                hide_dotfiles = false,
                hide_gitignored = false,
                hide_by_name = {
                    "node_modules",
                },
                never_show = {
                    "__pycache__",
                    ".DS_Store",
                    "thumbs.db",
                    ".git",
                },
            },
            follow_current_file = { enabled = true },
        },
        default_component_configs = {
            icon = {
                folder_empty = ""
            },
            git_status = {
                symbols = {
                    -- Change type
                    added     = " ",
                    modified  = " ",
                    deleted   = " ",
                    renamed   = "󰁕", -- this can only be used in the git_status source
                    -- Status type
                    untracked = "",
                    ignored   = "",
                    unstaged  = "󰄱",
                    staged    = "",
                    conflict  = "",
                }
            }
        },
        commands = {
            preview_diff = function(state)
                close_vim_fugitive_window()
                require("neo-tree.sources.filesystem.commands").open(state)
                vim.cmd [[ Gvdiffsplit! | wincmd = | Neotree git_status reveal ]]
            end,
            open_diff = function(state)
                close_vim_fugitive_window()
                require("neo-tree.sources.filesystem.commands").open(state)
                vim.cmd [[ Gvdiffsplit! | wincmd = | wincmd h ]]
            end,
            open_custom = function(state)
                close_vim_fugitive_window()
                require("neo-tree.sources.filesystem.commands").open(state)
            end,
            preview_file = function(state)
                close_vim_fugitive_window()
                require("neo-tree.sources.filesystem.commands").open(state)
                vim.cmd [[ Neotree git_status reveal ]]
            end,
            git_unstage_all = function()
                local events = require("neo-tree.events")
                local command = { "git", "reset" }
                vim.fn.system(command)
                events.fire_event(events.GIT_EVENT)
            end,
            git_commit_custom = function(state)
                if state.config.amend then
                    vim.cmd [[ wincmd l | Git commit --amend | wincmd j | wincmd c ]]
                else
                    print("Commiting")
                    vim.cmd [[ wincmd l | Git commit | wincmd k | wincmd c ]]
                end
                vim.schedule(function()
                    local events = require("neo-tree.events")
                    events.fire_event(events.GIT_EVENT)
                end)
            end,
            switch_to_filesystem = function()
                vim.cmd [[ Neotree filesystem reveal ]]
            end
        }

    }
}
