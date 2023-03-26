return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "mfussenegger/nvim-dap",
    },
    keys = {
        { "<F5>", "<CMD>DapContinue<CR>",         mode = "n" },
        { "<F6>", "<CMD>DapStepOver<CR>",         mode = "n" },
        { "<F7>", "<CMD>DapStepInto<CR>",         mode = "n" },
        { "<F8>", "<CMD>DapStepOut<CR>",          mode = "n" },
        { "<F9>", "<CMD>DapToggleBreakpoint<CR>", mode = "n" }
    },
    config = function()
        local dapui = require("dapui")
        local dap = require("dap")

        dapui.setup {
            layouts = {
                {
                    elements = { "console" },
                    size = 0.33,
                    position = "bottom",
                },
            },
        }

        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end

        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
            dap.repl.close()
        end

        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
            dap.repl.close()
        end
    end,
    init = function()
        vim.fn.sign_define("DapBreakpoint", { text = "󰏥", texthl = "DapBreakpoint" })
        vim.fn.sign_define("DapBreakpointRejected", { text = "󰏥" })
        vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped" })
    end
}
