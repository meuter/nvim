return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo", "Format", "FormatEnable", "FormatDisable" },
    keys = {
        { "<C-F>", "<cmd>Format<cr>", desc = "Format current buffer" },
    },
    config = function()
        require("conform").setup({
            format_on_save = function()
                if vim.g.disable_autoformat then
                    return
                end
                return { timeout_ms = 500, lsp_format = "fallback" }
            end,
        })

        vim.api.nvim_create_user_command("Format", function()
            vim.lsp.buf.format()
        end, {
            desc = "Format current buffer",
        })

        vim.api.nvim_create_user_command("FormatDisable", function()
            vim.g.disable_autoformat = true
        end, {
            desc = "Disable autoformat-on-save",
        })

        vim.api.nvim_create_user_command("FormatEnable", function()
            vim.b.disable_autoformat = false
            vim.g.disable_autoformat = false
        end, {
            desc = "Re-enable autoformat-on-save",
        })
    end
}
