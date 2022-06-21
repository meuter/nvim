local dapui = require("dapui")
local dap = require("dap")

require("dapui").setup({
    layouts = {
        {
            elements = {
                "stacks",
            },
            size = 30,
            position = "right",
        },
        {
            elements = {
                "scopes",
                "breakpoints",
            },
            size = 40,
            position = "left",
        },
        {
            elements = {
                "console",
            },
            size = 10,
            position = "bottom",
        },
    }
})

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
    require("neo-tree").close_all()
    require("aerial").close_all()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
    dap.repl.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
    dap.repl.close()
end

-- gutter symbols
vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected', { text = '🟡', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '⏩', texthl = '', linehl = '', numhl = '' })

-- keymap
vim.keymap.set("n", "<F5>", "<CMD>DapContinue<CR>")
vim.keymap.set("n", "<F6>", "<CMD>DapStepOver<CR>")
vim.keymap.set("n", "<F7>", "<CMD>DapStepInto<CR>")
vim.keymap.set("n", "<F8>", "<CMD>DapStepOut<CR>")
vim.keymap.set("n", "<F9>", "<CMD>DapToggleBreakpoint<CR>")
