local lsp_installer = require("nvim-lsp-installer")
local lspconfig = require("lspconfig")

lsp_installer.setup {
    ensure_installed = {
        "clangd",
        "sumneko_lua",
        "pyright"
    },
    ui = {
        border = 'rounded'
    }
}

-- configure all installed servers
for _, server in ipairs(lsp_installer.get_installed_servers()) do
    local server_options = {}
    local extra_available, extra_options = pcall(require, "drvim.lsp." .. server.name)
    if extra_available then
        server_options = vim.tbl_deep_extend("force", server_options, extra_options)
    end
    lspconfig[server.name].setup(server_options)
end

