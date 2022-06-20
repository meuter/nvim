local lsp_installer = require("nvim-lsp-installer")
local lspconfig = require("lspconfig")

lsp_installer.setup {
    ui = {
        border = "rounded"
    }
}

-- TODO(cme): look at https://github.com/p00f/clangd_extensions.nvim
-- NOTE(cme): see here for example https://github.com/bryant-the-coder/Cynosure/blob/main/lua/modules/lsp/init.lua
-- TODO(cme): look at rusttools

-- common server options
local common_server_options = {

    capabilities = require("cmp_nvim_lsp").update_capabilities(
        vim.lsp.protocol.make_client_capabilities()
    ),

    on_attach = function(_, buffer)
        local opts = { noremap=true, silent=true, buffer=buffer }
        vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
        vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
        vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
        vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

        vim.keymap.set("n", "<F1>", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
        vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
        vim.keymap.set("n", "<F3>", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
        vim.keymap.set("n", "<F4>", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
        vim.keymap.set("n", "<F12>", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

        vim.keymap.set("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    end
}

local function configure_installed_server()
    for _, server in ipairs(lsp_installer.get_installed_servers()) do
        local extra_available, extra_options = pcall(require, "drvim.lsp." .. server.name)
        if extra_available then
            common_server_options = vim.tbl_deep_extend("force", common_server_options, extra_options)
        end
        lspconfig[server.name].setup(common_server_options)
    end
end

-- configure installed server on startup
configure_installed_server()

vim.api.nvim_create_user_command("LspReconfigure",
    configure_installed_server,
    { desc = "Reconfigure Installed LSP Servers" }
)
