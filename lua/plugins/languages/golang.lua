-------------------------------------------------------------------------------
-- golang
-------------------------------------------------------------------------------
local golang = {}

function golang.on_mason_install(install)
    install {
        "gopls",
        "delve"
    }
end

function golang.on_treesitter_install(install)
    install {
        "go"
    }
end

function golang.on_setup_dap()
    local dap = require("dap")

    dap.adapters.delve = {
        type = "server",
        port = "${port}",
        executable = {
            command = "dlv",
            args = { "dap", "-l", "127.0.0.1:${port}" },
        },
    }

    dap.configurations.go = {
        {
            type = "delve",
            name = "Debug",
            request = "launch",
            program = "${file}",
        },
        {
            type = "delve",
            name = "Debug test",
            request = "launch",
            mode = "test",
            program = "${file}",
        },
        {
            type = "delve",
            name = "Debug test (go.mod)",
            request = "launch",
            mode = "test",
            program = "./${relativeFileDirname}",
        },
    }
end

return golang
