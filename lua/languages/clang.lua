-------------------------------------------------------------------------------
-- clang-extensions
-------------------------------------------------------------------------------
local clangd_extensions = {
    "p00f/clangd_extensions.nvim",
    dependencies = {
        "VonHeikemen/lsp-zero.nvim",
        "neovim/nvim-lspconfig",
        "nvim-lua/plenary.nvim",
        "mfussenegger/nvim-dap",
    }
}

-------------------------------------------------------------------------------
-- cmake-tools
-------------------------------------------------------------------------------
local cmake_tools = {
    "Civitasv/cmake-tools.nvim"
}

function cmake_tools.config()
    require("cmake-tools").setup {
        cmake_command = "cmake",
        cmake_build_directory = "build",
        cmake_generate_options = { "-D", "CMAKE_EXPORT_COMPILE_COMMANDS=1" },
        cmake_build_options = {},
        cmake_console_size = 10,
        cmake_show_console = "always",
        cmake_dap_configuration = { name = "cpp", type = "codelldb", request = "launch" }, -- dap configuration, optional
        cmake_dap_open_command = require("dap").repl.open, -- optional
        cmake_variants_message = {
            short = { show = true },
            long = { show = true, max_length = 40 }
        }
    }
end

-------------------------------------------------------------------------------
-- clang
-------------------------------------------------------------------------------
local clang = {
    plugins = {
        clangd_extensions,
        cmake_tools
    },
    tools = {
        "clangd",
        "cmake-language-server",
        "codelldb",
    },
    grammars = {
        "c",
        "cpp",
        "cmake",
        "make",
    }
}

function clang.on_lspzero_setup()
    require("clangd_extensions").setup {
        server = require("lsp-zero").build_options("clangd", {
            cmd = {
                "clangd",
                "-j=4",
                "--clang-tidy",
                "--background-index",
                "--suggest-missing-includes",
                "--header-insertion=never",
                "--fallback-style=webkit",
                "--all-scopes-completion",
                "--completion-style=detailed",
                "--pch-storage=memory",
            },
        })
    }
end

function clang.on_dap_setup()
    local dap = require("dap")

    dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
            command = "codelldb",
            args = { "--port", "${port}" },
        },
    }

    dap.configurations.c = {
        {
            name = "Launch",
            type = "codelldb",
            request = "launch",
            program = function()
                return vim.fn.input({
                    prompt = "Path to executable: ",
                    default = vim.fn.getcwd() .. "/",
                    completion = "file"
                })
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
            args = {},
        },
    }
    dap.configurations.cpp = dap.configurations.c
end

return clang
