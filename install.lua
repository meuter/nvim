local function install_packer()
    print("-- Installing Packer...")
    local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    vim.fn.system({ "git", "clone", "-b", "feat/lockfile", "--depth", "1", "https://github.com/EdenEast/packer.nvim", packer_path })
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
    require("packer.log").cfg({ log = { level = "trace" } })
    require("packer").sync()
    while not packer_done do
        vim.cmd [[ sleep 1 ]]
    end
end

local function install_language_support(languages)
    print("-- Installing Language Support...")
    local ts_installed, ts = pcall(require, "nvim-treesitter.install")
    local mason_installed, mason = pcall(require, "mason.api.command")
    for language, components in pairs(languages) do
        if ts_installed then
            ts.ensure_installed_sync(language)
        end
        if mason_installed then
            mason.MasonInstall(components)
        end
    end
end

local function all_done()
    print("-- All Done!")
    vim.cmd("quitall")
end

install_packer()
install_packages()
install_language_support {
    ["lua"]             = { "lua-language-server" },
    ["python"]          = { "pyright", "debugpy", "black" },
    ["c"]               = { "clangd", "codelldb" },
    ["dockerfile"]      = { "dockerfile-language-server" },
    ["bash"]            = { "bash-language-server" },
    ["json"]            = { "json-lsp" },
    ["go"]              = { "gopls", "delve" },
    ["markdown_inline"] = { "remark-language-server" },
    ["cmake"]           = { "cmake-language-server" },
    ["rust"]            = { "rust-analyzer", "codelldb" },
}
all_done()
