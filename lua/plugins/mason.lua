return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
        { "mason-org/mason.nvim", opts = {} }
    },
    opts = {
        ensure_installed = {
            "lua-language-server",
            "clangd",
            "pyright",
            "rust-analyzer",
            "bash-language-server",
            "docker-compose-language-service",
            "dockerfile-language-server",
            "neocmakelsp",
        }
    }
}
