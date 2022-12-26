local function search_count()
    local search = vim.fn.searchcount({ maxcount = 0 })
    if search.current > 0 and vim.v.hlsearch ~= 0 then
        return search.current .. "/" .. search.total
    end
    return ""
end

local function center(text, width)
    local spaces = width - vim.fn.strdisplaywidth(text)
    local left = math.floor(spaces / 2)
    local right = spaces - left
    return string.rep(" ", left) .. text .. string.rep(" ", right)
end

local function mode()
    return center(require("lualine.utils.mode").get_mode(), 8)
end

local function filename()
    local result = vim.fn.expand("%")
    if vim.bo.filetype == "neo-tree" then
        return ""
    end
    if vim.bo.filetype == "toggleterm" then
        return ""
    end
    if vim.bo.filetype == "Trouble" then
        return ""
    end
    if vim.bo.filetype == "DiffviewFiles" then
        return ""
    end
    if vim.bo.filetype == "packer" then
        return ""
    end
    if result == "" then
        return ""
    end
    local path = require("plenary.path")
    return path:new({ result, sep = "/" }):make_relative(vim.fn.getcwd())
end

local function lsp()
    local buf_clients = vim.lsp.buf_get_clients()
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
    return table.concat(buf_client_names, ", ")
end

local function macro()
    return vim.fn.reg_recording()
end

local function cwd()
    return vim.fn.getcwd():gsub(os.getenv("HOME"), "~")
end

local function terminal()
    return "[ " .. vim.b.toggle_number .. " ]"
end

local lualine = {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
}

function lualine.config()
    require("lualine").setup {
        options = {
            theme = "seoul256",
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            globalstatus = true,
            refresh = {
                statusline = 100,
            },
        },
        sections = {
            lualine_a = {
                { mode, color = { gui = "NONE" } },
            },
            lualine_b = {
                { "branch" },
                {
                    "diff",
                    diff_color = {
                        added = { fg = "#87af87" },
                        modified = { fg = "#c2c253" },
                        removed = { fg = "#d75f5f" },
                    },
                },
            },
            lualine_c = {
                { cwd, icon = "📁", color = { fg = "LightYellow" } },
                { filename, icon = "📝", color = { fg = "AliceBlue" } },
                { terminal, icon = "🖥️", color = { fg = "AliceBlue" } },
            },
            lualine_x = {
                { "location" },
                { macro, icon = "🎥", color = { fg = "AliceBlue" } },
                { "diagnostics", symbols = { error = " ", warn = " ", hint = " ", info = " " } },
                { search_count, icon = "🔎" },
            },
            lualine_y = {
                "filetype",
            },
            lualine_z = {
                { lsp, icon = "📡", color = { gui = "NONE" } },
            },
        },
    }
end

return lualine
