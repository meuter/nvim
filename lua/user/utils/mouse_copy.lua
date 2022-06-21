local M = {}

local ready_for_mouse_copy = true

function M.toggle_mouse_copy()
    pcall(vim.cmd, "IndentBlanklineToggle")
    pcall(vim.cmd, "Gitsigns toggle_signs")

    if ready_for_mouse_copy then
        vim.opt.mouse = "i"
        vim.opt.number = false
        vim.opt.list = false
        vim.opt.signcolumn = "no"
        ready_for_mouse_copy = false
    else
        vim.opt.mouse = "a"
        vim.opt.number = true
        vim.opt.list = true
        vim.opt.signcolumn = "yes"
        ready_for_mouse_copy = true
    end
end

return M
