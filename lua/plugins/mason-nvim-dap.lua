return {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "mfussenegger/nvim-dap",
        "nvim-treesitter/nvim-treesitter",
        "theHamsta/nvim-dap-virtual-text",
        "rcarriga/nvim-dap-ui",
    },
    keys = {
        { "<F5>", "<CMD>DapContinue<CR>",         mode = "n" },
        { "<F6>", "<CMD>DapStepOver<CR>",         mode = "n" },
        { "<F7>", "<CMD>DapStepInto<CR>",         mode = "n" },
        { "<F8>", "<CMD>DapStepOut<CR>",          mode = "n" },
        { "<F9>", "<CMD>DapToggleBreakpoint<CR>", mode = "n" }
    },
    config = function()
        require("mason-nvim-dap").setup { automatic_setup = true, }
        require("mason-nvim-dap").setup_handlers()
        require("nvim-dap-virtual-text").setup()

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
        vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#FF0000" })
        vim.api.nvim_set_hl(0, "DapStopped", { fg = "#87af87" })
        vim.fn.sign_define("DapBreakpoint", { text = "󰏥", texthl = "DapBreakpoint" })
        vim.fn.sign_define("DapBreakpointRejected", { text = "󰏥" })
        vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped" })
    end
}
