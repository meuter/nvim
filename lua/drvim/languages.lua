local M = {}

local languages = {
    ["c"]       = "clangd",
    ["python"]  = "pyright",
    ["lua"]     = "sumneko_lua"

    -- TODO(cme): support html, js, ts, react
    -- TODO(cme): support bash, dockerfile, ...
    -- TODO(cme): support rust
    -- TODO(cme): support go
}

-- TODO(cme): install all including boostrapping packer
function M.install()
    for language, lsp in pairs(languages) do
        vim.cmd("TSInstallSync! " .. language)
        vim.cmd("LspInstall --sync " .. lsp)
    end
end

return M

