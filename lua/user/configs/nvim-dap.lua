local dap = require('dap')

dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/local/bin/lldb-vscode',
    name = 'lldb'
}

dap.configurations.c = {
    {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
            -- TODO(cme): find executable in the workspace using Telescope
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
    }
}

dap.configurations.cpp = dap.configurations.c


-- TODO(cme): add support for go debugging
-- TODO(cme): add support for rust debugging
-- TODO(cme): add support for python debugging

