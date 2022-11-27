local Path = require("plenary.path")
local lualine = require("lualine")
local autocmd = vim.api.nvim_create_autocmd

local cwd = {
    function()
        local home = os.getenv("HOME")
        local icon = "📁 "
        return icon .. vim.fn.getcwd():gsub(home, "~")
    end,
    color = { fg = "LightYellow" }
}

local filename = {
    function()
        local filename = vim.fn.expand("%")
        if vim.bo.filetype == "neo-tree" then return "" end
        if vim.bo.filetype == "toggleterm" then return "" end
        if vim.bo.filetype == "Trouble" then return "" end
        if vim.bo.filetype == "DiffviewFiles" then return "" end
        if vim.bo.filetype == "packer" then return "" end
        if filename == "" then return "" end
        return "📝 " .. Path:new { filename, sep = "/" }:make_relative(vim.fn.getcwd())
    end,
    color = { fg = "AliceBlue" }
}


local branch = {
    "branch",
    icons_enabled = true,
    icon = "",
}

local mode = {
    "mode",
    color = { gui = "NONE" },
}

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn" },
    symbols = { error = " ", warn = " " },
    colored = true,
    update_in_insert = false,
    always_visible = false,
}

local search_count = {
    function()
        -- maxcount = 0 makes the number not be capped at 99
        local search = vim.fn.searchcount({ maxcount = 0 })
        local current = search.current
        local total = search.total
        if current > 0 and vim.v.hlsearch ~= 0 then
            return "🔎" .. current .. "/" .. total
        else
            return ""
        end
    end,
    color = { fg = "AliceBlue" }
}

local lsp = {
    function()
        local buf_clients = vim.lsp.buf_get_clients()
        if next(buf_clients) == nil then
            return ""
        end

        local null_ls_installed, null_ls = pcall(require, "null-ls")
        local buf_client_names = {}
        for _, client in pairs(buf_clients) do
            if client.name == "null-ls" then
                if null_ls_installed then
                    for formatter, formatter_config in pairs(null_ls.builtins.formatting) do
                        if vim.tbl_contains(formatter_config.filetypes, vim.bo.filetype) then
                            table.insert(buf_client_names, formatter)
                        end
                    end
                    for linter, linter_config in pairs(null_ls.builtins.diagnostics) do
                        if vim.tbl_contains(linter_config.filetypes, vim.bo.filetype) then
                            table.insert(buf_client_names, linter)
                        end
                    end
                end
            else
                table.insert(buf_client_names, client.name)
            end
        end
        return "📡" .. table.concat(buf_client_names, ", ") .. "🛰️"
    end,
    color = { gui = "NONE" },
}

local macro = {
    function()
        local recording_register = vim.fn.reg_recording()
        if recording_register == "" then
            return ""
        else
            return "🎥" .. recording_register
        end
    end,
    color = { fg = "AliceBlue" }
}

-- see https://www.reddit.com/r/neovim/comments/xy0tu1/cmdheight0_recording_macros_message/
autocmd("RecordingEnter", {
    callback = function()
        lualine.refresh({
            place = { "statusline" },
        })
    end,
})
autocmd("RecordingLeave", {
    callback = function()
        local timer = vim.loop.new_timer()
        timer:start(
            50,
            0,
            vim.schedule_wrap(function()
                lualine.refresh({
                    place = { "statusline" },
                })
            end)
        )
    end,
})


lualine.setup {
    options = {
        icons_enabled = true,
        theme = "seoul256",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        always_divide_middle = true,
        globalstatus = true
    },
    sections = {
        lualine_a = { mode },
        lualine_b = { branch },
        lualine_c = { cwd, filename },
        lualine_x = { macro, diagnostics, search_count },
        lualine_y = { "filetype" },
        lualine_z = { lsp }
    },
}
