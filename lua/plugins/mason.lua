local mason = {
    "williamboman/mason.nvim",
    commit = "60a03f55ab8b232c56c9ce3c4c3bf5673847e245"
}

function mason.config()
    require("mason").setup {
        ui = { border = "single" }
    }
end

function mason.build()
    require("plugins.languages").on_mason_install()
end

return mason
