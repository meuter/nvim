local Path = require("plenary.path")

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
        if filename == "" then return "" end
        if filename:find("term://", 1, true) == 1 then return "" end
        return "📝 " .. Path:new { filename, sep = "/" }:make_relative(vim.fn.getcwd())
    end,
    color = { fg = "AliceBlue" }
}


local branch = {
    "branch",
    icons_enabled = true,
    icon = "",
    color = { fg = "PaleGreen" }
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
    always_visible = true,
}

local lsp = function()
    local buf_clients = vim.lsp.buf_get_clients()
    if next(buf_clients) == nil then
        return ""
    end

    local buf_client_names = {}
    for _, client in pairs(buf_clients) do
        if client.name ~= "null-ls" then
            table.insert(buf_client_names, client.name)
        end
    end
    return "🔌" .. table.concat(buf_client_names, ", ")
end

require("lualine").setup {
    options = {
        icons_enabled = true,
        theme = "ayu_dark",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        always_divide_middle = true,
        globalstatus = true
    },
    sections = {
        lualine_a = { mode },
        lualine_b = { branch },
        lualine_c = { cwd, filename },
        lualine_x = { diagnostics },
        lualine_y = { "filetype", lsp },
        lualine_z = { "fileformat" }
    },
}
