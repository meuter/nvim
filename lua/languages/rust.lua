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

function rust.on_setup_dap()
    local dap = require("dap")

    dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
            command = "codelldb",
            args = { "--port", "${port}" },
        },
    }

    dap.configurations.rust = {
        {
            name = "Launch",
            type = "codelldb",
            request = "launch",
            program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
            args = {},
        },
    }
end

return rust
