-------------------------------------------------------------------------------
-- python
-------------------------------------------------------------------------------
local python = {}

function python.on_mason_install(install)
    install {
        "pyright",
        "black",
        "debugpy"
    }
end

function python.on_treesitter_install(install)
    install { "python" }
end

function python.on_setup_dap()
    local dap = require("dap")

    dap.adapters.python = {
        type = "executable",
        command = "debugpy-adapter",
    }

    dap.configurations.python = {
        {
            type = "python",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            pythonPath = function()
                local cwd = vim.fn.getcwd()
                if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
                    return cwd .. "/venv/bin/python"
                elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
                    return cwd .. "/.venv/bin/python"
                else
                    return "/usr/bin/python"
                end
            end,
        },
    }
end

return python
