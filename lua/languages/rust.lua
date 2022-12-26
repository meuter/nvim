-------------------------------------------------------------------------------
-- crates.nvim
-------------------------------------------------------------------------------
local crates = {
    "saecki/crates.nvim",
    tag = "v0.3.0",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "hrsh7th/nvim-cmp" }
    }
}

function crates.init()
    vim.api.nvim_create_autocmd("BufRead", {
        group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
        pattern = "Cargo.toml",
        callback = function()
            require("cmp").setup.buffer({ sources = { { name = "crates" } } })
        end,
    })
end

function crates.config()
    require("crates").setup()
end

-------------------------------------------------------------------------------
-- rust-tools
-------------------------------------------------------------------------------

local rust_tools = {
    "simrat39/rust-tools.nvim",
    dependencies = {
        "VonHeikemen/lsp-zero.nvim",
        "neovim/nvim-lspconfig",
        "nvim-lua/plenary.nvim",
        "mfussenegger/nvim-dap",
    }
}

-------------------------------------------------------------------------------
-- rust
-------------------------------------------------------------------------------

local rust = {
    crates,
    rust_tools
}

function rust.on_mason_install(install)
    install {
        "rust-analyzer",
        "codelldb",
        "taplo"
    }
end

function rust.on_treesitter_install(install)
    install {
        "rust",
        "toml",
    }
end

function rust.on_setup_lspzero()
    require("rust-tools").setup {
        server = require("lsp-zero").build_options("rust_analyzer", {})
    }
end

return rust
