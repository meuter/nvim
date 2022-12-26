-------------------------------------------------------------------------------
-- options
-------------------------------------------------------------------------------
-- backup, swap and undo
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.undofile = true
vim.opt.autoread = true

-- indent
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.wrapscan = true
vim.opt.smartcase = true

-- sign column
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"

-- display hidden character
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("lead:⋅")
vim.opt.listchars:append("trail:⋅")
vim.opt.listchars:append("eol:")
vim.opt.listchars:append("tab: ")
vim.opt.fillchars:append("diff: ")
vim.opt.fillchars:append("eob: ")

-- status and tab bar
vim.opt.cmdheight = 0
vim.opt.laststatus = 3
vim.opt.showtabline = 0

-- completion menu
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.pumheight = 10

-- misc
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.foldenable = false
vim.opt.wrap = false
vim.opt.updatetime = 100
vim.opt.shell = "/bin/bash"

-------------------------------------------------------------------------------
-- colors
-------------------------------------------------------------------------------

local float_bg = "#272727"
local diff_green = "#044025"
local diff_red = "#400404"
local diff_yellow = "#403d04"
local visual_selected = "#253747"

-- enable true colors
vim.opt.termguicolors = true

-- start with a builtin color scheme
vim.cmd("colorscheme habamax")

-- fixup some general highlight
vim.api.nvim_set_hl(0, "VertSplit", { bg = "NONE" })
vim.api.nvim_set_hl(0, "Visual", { fg = "NONE", bg = visual_selected })
vim.api.nvim_set_hl(0, "DiffAdd", { fg = "NONE", bg = diff_green })
vim.api.nvim_set_hl(0, "DiffChange", { fg = "NONE", bg = diff_green })
vim.api.nvim_set_hl(0, "DiffDelete", { fg = "NONE", bg = diff_red })
vim.api.nvim_set_hl(0, "DiffText", { fg = "NONE", bg = diff_yellow })
vim.api.nvim_set_hl(0, "Pmenu", { fg = "NONE", bg = float_bg })
vim.api.nvim_set_hl(0, "PmenuSel", { fg = "NONE", bg = visual_selected })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "NONE", bg = float_bg })
vim.api.nvim_set_hl(0, "LspInfoBorder", { fg = "NONE", bg = float_bg })

-- support for gitsign
vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#c2c253", bg = "NONE" })

-- support for Neotree
vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "SkyBlue3" })
vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "white" })
vim.api.nvim_set_hl(0, "NeoTreeRootName", { bold = true, fg = "white" })
vim.api.nvim_set_hl(0, "NeoTreeGitAdded", { fg = "green" })
vim.api.nvim_set_hl(0, "NeoTreeGitConflict", { fg = "red" })
vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = "AliceBlue" })
vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = "LightYellow" })
vim.api.nvim_set_hl(0, "NeoTreeSymbolicLinkTarget", { fg = "cyan" })

-- support for Telescope
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "NONE", bg = float_bg })
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = float_bg })

-------------------------------------------------------------------------------
-- keymaps
-------------------------------------------------------------------------------

-- Tab/Shift+tab to indent/dedent
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("n", "<Tab>", "v><C-\\><C-N>")
vim.keymap.set("v", "<S-Tab>", "<gv")
vim.keymap.set("n", "<S-Tab>", "v<<C-\\><C-N>")
vim.keymap.set("i", "<S-Tab>", "<C-\\><C-N>v<<C-\\><C-N>^i")

-- Ctrl+Left/Right use word boundary
vim.keymap.set("n", "<C-Left>", "b")
vim.keymap.set("n", "<C-Right>", "w")

-- Alt+Left/Right to navigate jumplist
vim.keymap.set("n", "<A-Left>", "<C-O>")
vim.keymap.set("n", "<A-Right>", "<C-I>")

-- Ctrl+w in insert mode automatically escpaces
vim.keymap.set("i", "<C-w>", "<C-\\><C-n><C-w>")

-- dismiss search highlight with esc
vim.keymap.set({ "n", "v" }, "<ESC>", "<CMD>nohl<CR><ESC>")


-------------------------------------------------------------------------------
-- commands
-------------------------------------------------------------------------------

-- always open help windows in full screen
vim.api.nvim_create_autocmd("BufEnter", {
    group = vim.api.nvim_create_augroup("OpenHelpInFullWindow", { clear = true }),
    callback = function()
        if vim.bo.filetype == "help" then
            local key = vim.api.nvim_replace_termcodes("<C-w>o", true, false, true)
            vim.api.nvim_feedkeys(key, "n", false)
        end
    end,
})

-- with autoread set, this forces a check of changed files when focus changes
-- (useful when using space age sed to search and replace behing vim's back)
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
    group = vim.api.nvim_create_augroup("CheckReloadOnFocusChange", { clear = true }),
    command = "checktime",
})

-------------------------------------------------------------------------------
-- plugins
-------------------------------------------------------------------------------

-- automatically bootstrap package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

-- load all plugins
require("lazy").setup("plugins", {
    ui = { border = "single" },
})
