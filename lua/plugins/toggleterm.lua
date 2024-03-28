return {
    "akinsho/toggleterm.nvim",
    version = "*",
    dependencies = {
        "stevearc/dressing.nvim"
    },
    opts = {
        open_mapping = [[<c-\>]],
        direction = "tab",
        shell = "/bin/bash",
        size = function()
            return math.ceil(vim.o.lines * .4)
        end,
        winbar = {
            enabled = false,
        }
    },
    init = function()
        vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
            group = vim.api.nvim_create_augroup("ToggleTermAlwaysEnterInInsert", { clear = true }),
            pattern = "term://*",
            callback = function()
                vim.cmd("startinsert")
            end
        })

        vim.api.nvim_create_autocmd({ "TermOpen" }, {
            group = vim.api.nvim_create_augroup("ToggleTermKeyMap", { clear = true }),
            callback = function()
                local opts = { buffer = 0 }
                vim.api.nvim_set_hl(0, "WinBarActive", { underline = false, fg = "AliceBlue", bg = "NONE" })
                vim.api.nvim_set_hl(0, "WinBarInactive", { underline = false, fg = "#777777", bg = "NONE" })
                vim.keymap.set("t", "<esc><esc>", [[<C-\><C-n>]], opts)
                vim.keymap.set("v", [[<c-\>]], "<CMD>ToggleTerm<CR>", opts)
                vim.keymap.set({ "t", "n" }, "<F2>", "<CMD>ToggleTermSetName<CR>", opts)
                vim.keymap.set({ "t", "n" }, "<C-w>o", function()
                    vim.cmd("ToggleTerm")
                    vim.cmd("ToggleTerm direction=tab")
                    vim.api.nvim_feedkeys("i", "n", false)
                end, opts)
                vim.keymap.set({ "t", "n" }, "<C-w>m", function()
                    vim.cmd("ToggleTerm")
                    vim.cmd("ToggleTerm direction=horizontal")
                    vim.api.nvim_feedkeys("i", "n", false)
                end, opts)
                for i = 0, 9 do
                    vim.keymap.set({ "t", "n" }, "<C-w>" .. i, function()
                        vim.cmd("ToggleTerm")
                        vim.cmd(i .. "ToggleTerm")
                        vim.api.nvim_feedkeys("i", "n", false)
                    end, opts)
                end
                vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
            end
        })
    end
}
