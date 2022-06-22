local lsp_installer = require("nvim-lsp-installer")
local lspconfig = require("lspconfig")

lsp_installer.setup {
    ui = {
        border = "rounded"
    }
}

-- TODO(cme): look at rusttools

local function update_capabilities()
    return require("cmp_nvim_lsp").update_capabilities(
        vim.lsp.protocol.make_client_capabilities()
    )
end

local function on_attach(client, buffer)

    update_capabilities()

    local aerial_available, aerial = pcall(require, "aerial")
    if aerial_available then
        aerial.on_attach(client, buffer)
    end

    local lsp_format_available, lsp_format = pcall(require, "lsp-format")
    if lsp_format_available then
        lsp_format.on_attach(client)
    end


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
end

for _, server in ipairs(lsp_installer.get_installed_servers()) do
    local common_server_options = {
        capabilities = update_capabilities(),
        on_attach = on_attach
    }
    local extra_available, extra_options = pcall(require, "user.lsp." .. server.name)
    if not extra_available then extra_options = {} end
    local server_options = vim.tbl_deep_extend("force", common_server_options, extra_options)
    lspconfig[server.name].setup(server_options)
end

