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

function M.project_files(opts)
    opts = opts or {}
    local ok, telescope_builtin = pcall(require, "telescope.builtin")
    if not ok then return end

    local git_files_ok = pcall(telescope_builtin.git_files, opts)
    if not git_files_ok then
        telescope_builtin.find_files(opts)
    end
end


return M
