local M = { }
local lsp_formatting_group = vim.api.nvim_create_augroup("LspFormatting", {})

function M.format()
    vim.lsp.buf.formatting_sync()
end

function M.enable_format_on_save()
    vim.api.nvim_clear_autocmds({ group = lsp_formatting_group })
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = lsp_formatting_group,
        callback = M.format
    })
end

function M.disable_format_on_save()
    vim.api.nvim_clear_autocmds({ group = lsp_formatting_group })
end

return M
