local M = {}

-- List all languages that should be supported along with
-- corresponding lsp servers.
local languages = {
    ["c"]       = "clangd",
    ["python"]  = "pyright",
    ["lua"]     = "sumneko_lua"
}

function M.install()
    for language, lsp in pairs(languages) do
        vim.cmd("TSInstallSync! " .. language)
        vim.cmd("LspInstall --sync " .. lsp)
    end
end

return M

