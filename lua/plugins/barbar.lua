return {
    "romgrk/barbar.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    opts = {
        animation = false,
        auto_hide = true,
        diagnostics = {
            [vim.diagnostic.severity.ERROR] = { enabled = false },
            [vim.diagnostic.severity.WARN] = { enabled = false },
            [vim.diagnostic.severity.INFO] = { enabled = false },
            [vim.diagnostic.severity.HINT] = { enabled = false },
        },
        icon_separator_active = "",
        icon_separator_inactive = "",
        no_name_title = "scratch"
    },
    init = function()
        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }

        map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
        map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
        map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
        map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
        map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)


        vim.api.nvim_create_autocmd("FileType", {
            callback = function(tbl)
                local set_offset = require("bufferline.api").set_offset

                local bufwinid
                local last_width
                local autocmd = vim.api.nvim_create_autocmd("WinScrolled", {
                    callback = function()
                        bufwinid = bufwinid or vim.fn.bufwinid(tbl.buf)

                        local ok, width = pcall(vim.api.nvim_win_get_width, bufwinid)
                        if ok then
                            if width ~= last_width then
                                set_offset(width, "")
                                last_width = width
                            end
                        end
                    end,
                })

                vim.api.nvim_create_autocmd("BufWipeout", {
                    buffer = tbl.buf,
                    callback = function()
                        vim.api.nvim_del_autocmd(autocmd)
                        set_offset(0)
                    end,
                    once = true,
                })
            end,
            pattern = { "neo-tree", "DiffviewFiles" }
        })
    end
}
