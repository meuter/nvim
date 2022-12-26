-------------------------------------------------------------------------------
-- clang
-------------------------------------------------------------------------------
local clang = {
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
    require("lsp-zero").configure("clangd", {
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
