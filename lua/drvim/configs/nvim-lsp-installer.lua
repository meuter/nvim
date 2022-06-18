local lsp_installer = require('nvim-lsp-installer')

lsp_installer.settings {
    ui = {
        border = 'rounded'
    }
}

lsp_installer.on_server_ready(function(server)
    local _, options = pcall(require, "drvim.lsp." .. server.name)
    server:setup(options or {})
end)
