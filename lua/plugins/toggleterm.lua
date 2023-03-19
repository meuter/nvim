return {
    "akinsho/toggleterm.nvim",
    version = "*",
    dependencies = {
        "stevearc/dressing.nvim"
    },
    opts = {
        open_mapping = [[<c-\>]],
        direction = "horizontal",
        shell = "/bin/bash",
        size = function()
            return math.ceil(vim.o.lines * .4)
        end,
        winbar = {
            enabled = true,
            name_formatter = function(term)
                if term.display_name then
                    return "🖥️" .. term.display_name .. "[" .. term.id .. "]"
                else
                    return "🖥️" .. "[" .. term.id .. "]"
                end
            end
        }
    },
    init = function()
        vim.api.nvim_create_autocmd({ "TermOpen" }, {
            group = vim.api.nvim_create_augroup("ToggleTermKeyMap", { clear = true }),
            callback = function()
                local opts = { buffer = 0 }
                vim.api.nvim_set_hl(0, "WinBarActive", { underline = false, fg = "AliceBlue" })
                vim.keymap.set("t", "<esc><esc><esc>", [[<C-\><C-n>]], opts)
                vim.keymap.set({ "t", "n" }, "<F2>", "<CMD>ToggleTermSetName<CR>", opts)
                vim.keymap.set({ "t", "n" }, "<C-w>o", function()
                    vim.cmd("ToggleTerm")
                    vim.cmd("ToggleTerm direction=tab")
                    vim.api.nvim_feedkeys("i", "n", false)
                end, opts)
                vim.keymap.set({ "t", "n" }, "<C-w>n", function()
                    vim.cmd("ToggleTerm")
                    vim.cmd("ToggleTerm direction=horizontal")
                    vim.api.nvim_feedkeys("i", "n", false)
                end, opts)
                -- vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
                for i = 0, 9 do
                    vim.keymap.set({ "t", "n" }, "<C-w>" .. i, function()
                        vim.cmd("ToggleTerm")
                        vim.cmd(i .. "ToggleTerm")
                        vim.api.nvim_feedkeys("i", "n", false)
                    end, opts)
                end
            end
        })
    end
}
