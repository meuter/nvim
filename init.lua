-------------------------------------------------------------------------------
-- Options
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
vim.opt.listchars:append("tab:▸▸")
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
vim.opt.shell = "/bin/bash"
vim.opt.confirm = true
vim.opt.termguicolors = true

vim.opt.cmdheight = 0

-- not need to do this before showing the main window.
vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
        vim.opt.clipboard = "unnamedplus"
    end,
})

-------------------------------------------------------------------------------
-- Key Maps
-------------------------------------------------------------------------------

-- Tab/Shift+tab to indent/dedent
vim.keymap.set("n", "<Tab>", ">>")
vim.keymap.set("n", "<S-Tab>", "<<")
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")
vim.keymap.set("i", "<S-Tab>", "<C-\\><C-N><<<C-\\><C-N>^i")

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

-- Ctrl+r in visual mode to start a replace of the current visual selection
vim.keymap.set("v", "<C-r>", "\"hy:%s/<C-r>h//gc<left><left><left>")

-- ';' and ',' key in normal mode, appends ';' or ',' at the end of the line
vim.keymap.set("n", ";", "msA;<ESC>`s<CMD>delmakrs s<CR><ESC>")
vim.keymap.set("n", ",", "msA,<ESC>`s<CMD>delmakrs s<CR><ESC>")

-- kill buffer without exiting
vim.keymap.set("n", "<A-w>", "<CMD>bp<bar>sp<bar>bn<bar>bd<CR>")

-------------------------------------------------------------------------------
-- Autocommands
-------------------------------------------------------------------------------

-- replace window when opening help
vim.api.nvim_create_autocmd("BufEnter", {
    group = vim.api.nvim_create_augroup("HelpReplaceWindow", { clear = true }),
    callback = function()
        if vim.bo.filetype == "help" and vim.b.already_opened == nil then
            -- remember we already opened this buffer
            vim.b.already_opened = true

            -- close the original window
            local original_win = vim.fn.win_getid(vim.fn.winnr('#'))
            local help_win = vim.api.nvim_get_current_win()
            if original_win ~= help_win then
                vim.api.nvim_win_close(original_win, false)
            end

            -- put the help buffer in the buffer list
            vim.bo.buflisted = true
        end
    end,
})

-- 'set autoread' requires you to save the file to detect the change... let's fix this
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
    group = vim.api.nvim_create_augroup("AutoRealodFileModifiedInTheBackground", { clear = true }),
    callback = function()
        local bufnr = tonumber(vim.fn.expand("<abuf>")) or 0
        if bufnr == 0 then
            return
        end

        local name = vim.api.nvim_buf_get_name(bufnr)
        if name == "" or vim.bo[bufnr].buftype ~= "" or not vim.fn.filereadable(name) then
            return
        end

        vim.cmd(bufnr .. "checktime")
    end,
})

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-------------------------------------------------------------------------------
-- Fixup Path for WSL
-------------------------------------------------------------------------------
if vim.fn.getenv("WSLENV") ~= nil then
    -- on WSL the path is littered with the Windows hosts's PATH which
    -- slows down vim.fn.exepath
    local path = vim.fn.getenv("PATH")
    local fixed = {}
    for _, entry in ipairs(vim.fn.split(path, ":")) do
        if not string.match(entry, "/mnt/c/.*") then
            fixed[#fixed + 1] = entry
        end
    end
    local fixed_path = table.concat(fixed, ":")
    vim.fn.setenv("PATH", fixed_path)
end

-------------------------------------------------------------------------------
-- Plugins
-------------------------------------------------------------------------------

-- install plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    print("Installing 'folke/lazy.nvim'")
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- bootstrap packages
require("lazy").setup("plugins", {
    ui = { border = "single" },
    change_detection = {
        enabled = false,
        notify = false
    }
})
