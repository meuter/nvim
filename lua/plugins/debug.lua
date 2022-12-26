-------------------------------------------------------------------------------
-- dap
-------------------------------------------------------------------------------
local nvim_dap = {
    "mfussenegger/nvim-dap",
}

function nvim_dap.config()
    require("languages").for_each(function(language)
        if language.on_dap_setup ~= nil then
            language.on_dap_setup()
        end
    end)
end

-------------------------------------------------------------------------------
-- dap-virtual-text
-------------------------------------------------------------------------------
local nvim_dap_virtual_text = {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-treesitter/nvim-treesitter"
    }
}

function nvim_dap_virtual_text.config()
    require("nvim-dap-virtual-text").setup {}
end

-------------------------------------------------------------------------------
-- dap-ui
-------------------------------------------------------------------------------
local nvim_dapui = {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "mfussenegger/nvim-dap",
    }
}

function nvim_dapui.config()
    local dapui = require("dapui")
    local dap = require("dap")

    dapui.setup {
        expand_lines = true,
        icons = {
            expanded = "",
            collapsed = "",
            circular = "",
        },
        controls = {
            icons = {
                pause = "",
                play = "",
                step_into = "",
                step_over = "",
                step_out = "",
                step_back = "",
                run_last = "↻",
                terminate = "□",
            },
        },
        layouts = {
            {
                elements = {
                    { id = "scopes", size = 0.33 },
                    { id = "breakpoints", size = 0.17 },
                    { id = "stacks", size = 0.25 },
                    { id = "watches", size = 0.25 },
                },
                size = 0.33,
                position = "right",
            },
            {
                elements = {
                    { id = "repl", size = 0.45 },
                    { id = "console", size = 0.55 },
                },
                size = 0.27,
                position = "bottom",
            },
        },
        floating = {
            max_height = 0.9,
            max_width = 0.5, -- Floats will be treated as percentage of your screen.
            border = "single",
            mappings = {
                close = { "q", "<Esc>" },
            },
        },
    }

    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
        local neotree_loaded, neotree = pcall(require, "neo-tree")
        if neotree_loaded then
            neotree.close_all()
        end
    end

    dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
        dap.repl.close()
    end

    dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
        dap.repl.close()
    end
end

function nvim_dapui.init()
    -- gutter symbols
    vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointRejected", { text = "🟡", texthl = "", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = "⏩", texthl = "", linehl = "", numhl = "" })

    -- keymap
    vim.keymap.set("n", "<F5>", "<CMD>DapContinue<CR>")
    vim.keymap.set("n", "<F6>", "<CMD>DapStepOver<CR>")
    vim.keymap.set("n", "<F7>", "<CMD>DapStepInto<CR>")
    vim.keymap.set("n", "<F8>", "<CMD>DapStepOut<CR>")
    vim.keymap.set("n", "<F9>", "<CMD>DapToggleBreakpoint<CR>")
end

-------------------------------------------------------------------------------
-- debug
-------------------------------------------------------------------------------
return {
    nvim_dap,
    nvim_dap_virtual_text,
    nvim_dapui
}
