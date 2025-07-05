-------------------------------------------------------------------------------
-- Options
-------------------------------------------------------------------------------

-- Basic settings
vim.opt.number = true          -- Line numbers
vim.opt.relativenumber = false -- No relative line numbers
vim.opt.cursorline = true      -- Highlight current line
vim.opt.wrap = false           -- Don't wrap lines
vim.opt.scrolloff = 10         -- Keep 10 lines above/below cursor
vim.opt.sidescrolloff = 8      -- Keep 8 columns left/right of cursor

-- Indentation
vim.opt.tabstop = 4        -- Tab width
vim.opt.shiftwidth = 4     -- Indent width
vim.opt.softtabstop = 4    -- Soft tab stop
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.smartindent = true -- Smart auto-indenting
vim.opt.autoindent = true  -- Copy indent from current line

-- Search settings
vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true  -- Case sensitive if uppercase in search
vim.opt.hlsearch = true   -- Highlight search results
vim.opt.incsearch = true  -- Show matches as you type
vim.opt.wrapscan = true   -- Continue search from the top

-- Visual settings
vim.opt.termguicolors = true                      -- Enable 24-bit colors
vim.opt.signcolumn = "yes"                        -- Always show sign column
vim.opt.numberwidth = 4                           -- Sign columns is 4 character wide
vim.opt.showmatch = true                          -- Highlight matching brackets
vim.opt.matchtime = 2                             -- How long to show matching bracket
vim.opt.cmdheight = 1                             -- Command line height
vim.opt.completeopt = "menuone,noinsert,noselect" -- Completion options
vim.opt.showmode = false                          -- Don't show mode in command line
vim.opt.pumheight = 10                            -- Popup menu height
vim.opt.pumblend = 10                             -- Popup menu transparency
vim.opt.winblend = 0                              -- Floating window transparency
vim.opt.conceallevel = 0                          -- Don't hide markup
vim.opt.concealcursor = ""                        -- Don't hide cursor line markup
vim.opt.lazyredraw = true                         -- Don't redraw during macros
vim.opt.synmaxcol = 300                           -- Syntax highlighting limit

-- File handling
vim.opt.backup = false      -- Don't create backup files
vim.opt.writebackup = false -- Don't create backup before writing
vim.opt.swapfile = false    -- Don't create swap files
vim.opt.undofile = true     -- Persistent undo
vim.opt.updatetime = 300    -- Faster completion
vim.opt.timeoutlen = 500    -- Key timeout duration
vim.opt.ttimeoutlen = 0     -- Key code timeout
vim.opt.autoread = true     -- Auto reload files changed outside vim
vim.opt.autowrite = false   -- Don't auto save

-- Display hidden character
vim.opt.list = true
vim.opt.listchars:append("space:⋅") -- Space as a dot
vim.opt.listchars:append("lead:⋅") -- Same for leading space
vim.opt.listchars:append("trail:⋅") -- Same for trailing space
vim.opt.listchars:append("eol:") -- End-of-line as a return arrow
vim.opt.listchars:append("tab:» ") -- Tab as double chevron
vim.opt.fillchars:append("diff: ") -- Diff as whitespace
vim.opt.fillchars:append("eob: ") -- End-of-buffer as whitespace

-- Behavior settings
vim.opt.hidden = true                  -- Allow hidden buffers
vim.opt.errorbells = false             -- No error bells
vim.opt.backspace = "indent,eol,start" -- Better backspace behavior
vim.opt.autochdir = false              -- Don't auto change directory
vim.opt.iskeyword:append("-")          -- Treat dash as part of word
vim.opt.path:append("**")              -- include subdirectories in search
vim.opt.selection = "exclusive"        -- Selection behavior
vim.opt.mouse = "a"                    -- Enable mouse support
vim.schedule(function()                -- Use system clipboard
    vim.opt.clipboard:append("unnamedplus")
end)
vim.opt.modifiable = true  -- Allow buffer modifications
vim.opt.encoding = "UTF-8" -- Set encoding

-- Split behavior
vim.opt.splitbelow = true -- Horizontal splits go below
vim.opt.splitright = true -- Vertical splits go right

-- Shell
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

-- When pasting over a visual selection, avoid clobbering register
vim.keymap.set("v", "p", '"_dP')

-- Ctrl+w in insert mode automatically escpaces
vim.keymap.set("i", "<C-w>", "<C-\\><C-n><C-w>")

-- Dismiss search highlight with esc
vim.keymap.set({ "n", "v" }, "<ESC>", "<CMD>nohl<CR><ESC>")

-- Escape in terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")

-- Move lines up/down and keep selection in visual mode
vim.keymap.set("n", "<A-down>", ":m .+1<CR>==", { silent = true })
vim.keymap.set("n", "<A-up>", ":m .-2<CR>==", { silent = true })
vim.keymap.set("v", "<A-down>", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<A-up>", ":m '<-2<CR>gv=gv", { silent = true })

-- Improve indenting
vim.keymap.set("v", "<", "<gv", { silent = true })
vim.keymap.set("v", ">", ">gv", { silent = true })
vim.keymap.set("n", "<", "<<", { silent = true })
vim.keymap.set("n", ">", ">>", { silent = true })

-------------------------------------------------------------------------------
-- Autocommands
-------------------------------------------------------------------------------

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- In C++ and C use // as comment style
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("cpp-commentstring", { clear = true }),
    pattern = { "c", "cpp" },
    callback = function()
        vim.opt.commentstring = "// %s"
    end,
})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
    group = vim.api.nvim_create_augroup("vim-lastplace", { clear = true }),
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})


-- Auto-resize splits when window is resized
vim.api.nvim_create_autocmd("VimResized", {
    group = vim.api.nvim_create_augroup("resize-split-on-window-resize", { clear = true }),
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})

-------------------------------------------------------------------------------
-- Plugins
-------------------------------------------------------------------------------

-- Download lazy package manager
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

-- Bootstrap package installation and initialization
require("lazy").setup("plugins", {
    concurrency = 4,
    change_detection = {
        enabled = false,
        notify = false,
    },
})
