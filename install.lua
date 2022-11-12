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
    local ts_installed, ts = pcall(require, "nvim-treesitter.install")
    local lsp_installed, lsp = pcall(require, "nvim-lsp-installer")
    for language, lsp in pairs(languages) do
        if ts_installed then
            ts.ensure_installed_sync(language)
        end
        if lsp_installed then
            require("nvim-lsp-installer").install_sync({ lsp })
        end
    end
end

local function pin_package_to_commits()
    if os.getenv("NVIM_CONFIG_INSTALL_ALL_FROM_MASTER") ~= nil then
        print("-- Pinning Packages ...")
        local packer_utils = require("user.utils.packer_utils")
        local installed = packer_utils.list_installed_plugins_paths()
        local packer_lock_table = {}
        for _, plugin_path in ipairs(installed) do
            local plugin_name = packer_utils.extract_plugin_name_from_path(plugin_path)
            packer_lock_table[plugin_name] = packer_utils.get_plugin_revision(plugin_path)
        end
        local packer_lock_path = vim.fn.stdpath("config") .. "/lua/user/packer_lock.lua"
        local packer_lock_file = assert(io.open(packer_lock_path, "wb"))
        packer_lock_file:write("return " .. vim.inspect(packer_lock_table, {indent="    "}))
        packer_lock_file:close()
    end
end

local function all_done()
    print("-- All Done!")
    vim.cmd("quitall")
end

install_packer()
install_packages()
pin_package_to_commits()
install_language_support()
all_done()
