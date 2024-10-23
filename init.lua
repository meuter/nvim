-------------------------------------------------------------------------------
-- Options
-------------------------------------------------------------------------------

-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

-- left columns
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
vim.opt.listchars:append("tab:» ")
vim.opt.fillchars:append("diff: ")
vim.opt.fillchars:append("eob: ")

-- status and tab bar
vim.opt.laststatus = 3
vim.opt.showmode = false
vim.opt.showtabline = 0

-- completion menu
vim.opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }
vim.opt.pumheight = 10

-- misc
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.cursorline = true
vim.opt.foldenable = false
vim.opt.wrap = false
vim.opt.updatetime = 100
vim.opt.confirm = true
vim.opt.termguicolors = true

-- from kickstart
vim.opt.mouse = "a"
vim.schedule(function()
    vim.opt.clipboard = "unnamedplus"
end)
vim.opt.breakindent = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.list = true
vim.opt.inccommand = "split"

-- shell
if (vim.fn.has("win32") == 1) or (vim.fn.has("win64") == 1) then
    vim.opt.shell = "pwsh"
    vim.opt.shellcmdflag = "-command"
    vim.opt.shellquote = "\""
    vim.opt.shellxquote = ""
else
    vim.opt.shell = "/bin/bash"
end

-------------------------------------------------------------------------------
-- Keymap
-------------------------------------------------------------------------------

-- Tab/Shift+tab to indent/dedent
vim.keymap.set("n", ">", ">>")
vim.keymap.set("n", "<", "<<")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- When pasting over a visual selection, avoid clobbering register
vim.keymap.set("v", "p", '"_dP')

-- Ctrl+Left/Right use word boundary
vim.keymap.set("n", "<C-Left>", "b")
vim.keymap.set("n", "<C-Right>", "w")

-- Ctrl+w in insert mode automatically escpaces
vim.keymap.set("i", "<C-w>", "<C-\\><C-n><C-w>")

-- kill buffer without exiting
vim.keymap.set("n", "<A-w>", "<CMD>bp<bar>sp<bar>bn<bar>bd<CR>")

-- dismiss search highlight with esc
vim.keymap.set({ "n", "v" }, "<ESC>", "<CMD>nohl<CR><ESC>")

-- escape in terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-------------------------------------------------------------------------------
-- Autocommands
-------------------------------------------------------------------------------

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("cpp-commentstring", { clear = true }),
    pattern = { "c", "cpp" },
    callback = function()
        vim.opt.commentstring = "// %s"
    end,
})

-------------------------------------------------------------------------------
-- Plugins
-------------------------------------------------------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
---@diagnostic disable-next-line: undefined-field
if not vim.loop.fs_stat(lazypath) then
    print("Installing 'folke/lazy.nvim'...")
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
    change_detection = {
        enabled = false,
        notify = false,
    },
})
