local function install_packer()
    print("-- Installing Packer...")
    local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", packer_path })
    vim.cmd "packadd packer.nvim"
end

local function install_packages()
    print("-- Packer Sync...")
    local packer_done = false
    vim.api.nvim_create_autocmd("User", {
        pattern = "PackerComplete",
        callback = function()
            packer_done = true
        end
    })
    require("user.plugins")
    require("packer").sync()
    while not packer_done do
        vim.cmd [[ sleep 1 ]]
    end
end

local function install_language_support()
    print("-- Installing Language Support...")
    local languages = require("user.languages")
    for language, lsp in pairs(languages) do
        require("nvim-treesitter.install").ensure_installed_sync(language)
        require("nvim-lsp-installer").install_sync({ lsp })
    end
end

local function all_done()
    print("-- All Done!")
    vim.cmd("quitall")
end

install_packer()
install_packages()
install_language_support()
all_done()



