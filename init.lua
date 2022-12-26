-------------------------------------------------------------------------------
-- options
-------------------------------------------------------------------------------
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.undofile = true
vim.opt.autoread = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.wrapscan = true
vim.opt.smartcase = true
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("lead:⋅")
vim.opt.listchars:append("trail:⋅")
vim.opt.listchars:append("eol:")
vim.opt.listchars:append("tab: ")
vim.opt.fillchars:append("diff: ")
vim.opt.fillchars:append("eob: ")
vim.opt.cmdheight = 0
vim.opt.laststatus = 3
vim.opt.showtabline = 0
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.pumheight = 10
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.foldenable = false
vim.opt.wrap = false
vim.opt.updatetime = 100
vim.opt.shortmess:append("ca")
vim.opt.shell = "/bin/bash"

-------------------------------------------------------------------------------
-- colors
-------------------------------------------------------------------------------
vim.opt.termguicolors = true

local float_bg = "#272727"
local visual_selected = "#253747"

vim.cmd("colorscheme habamax")

-- fixup some general highlight
vim.api.nvim_set_hl(0, "VertSplit", { bg = "NONE" })
vim.api.nvim_set_hl(0, "Visual", { fg = "NONE", bg = visual_selected })
vim.api.nvim_set_hl(0, "DiffAdd", { fg = "NONE", bg = "#044025" })
vim.api.nvim_set_hl(0, "DiffChange", { fg = "NONE", bg = "#044025" })
vim.api.nvim_set_hl(0, "DiffDelete", { fg = "NONE", bg = "#400404" })
vim.api.nvim_set_hl(0, "DiffText", { fg = "NONE", bg = "#403d04" })
vim.api.nvim_set_hl(0, "Pmenu", { fg = "NONE", bg = float_bg })
vim.api.nvim_set_hl(0, "PmenuSel", { fg = "NONE", bg = visual_selected })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "NONE", bg = float_bg })
vim.api.nvim_set_hl(0, "LspInfoBorder", { fg = "NONE", bg = float_bg })

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
-- plugins
-------------------------------------------------------------------------------

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
require("lazy").setup("plugins", {
    ui = { border = "single" },
})
