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
    plugins = {
        crates,
        rust_tools
    },
    tools = {
        "rust-analyzer",
        "codelldb",
        "taplo"
    },
    grammars = {
        "rust",
        "toml",
    }
}

function rust.on_lspzero_setup()
    require("rust-tools").setup {
        server = require("lsp-zero").build_options("rust_analyzer", {})
    }
end

function rust.on_dap_setup()
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
