local opt = vim.opt
opt.backup = false                           -- don't creates a backup file
opt.clipboard = "unnamedplus"                -- allows neovim to access the system clipboard
opt.completeopt = { "menuone", "noselect" }  -- mostly just for cmp
opt.conceallevel = 0                         -- so that `` is visible in markdown files
opt.fileencoding = "utf-8"                   -- the encoding written to a file
opt.hlsearch = true                          -- highlight all matches on previous search pattern
opt.ignorecase = true                        -- ignore case in search patterns
opt.incsearch = true                         -- highlight as you search
opt.wrapscan = true                          -- wrap to beginning of file when going to next match
opt.mouse = "a"                              -- allow the mouse to be used in neovim
opt.pumheight = 10                           -- pop up menu height
opt.showmode = false                         -- we don't need to see things like -- INSERT -- anymore
opt.showtabline = 0                          -- never show tabs
opt.smartcase = true                         -- smart case when searching (case insensitive until you type a capital letter)
opt.smartindent = true                      -- make indenting smarter again
opt.splitbelow = true                       -- force all horizontal splits to go below current window
opt.splitright = true                       -- force all vertical splits to go to the right of current window
opt.swapfile = false                        -- no swapfile
opt.termguicolors = true                    -- set term gui colors (most terminals support this)
opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
opt.undofile = true                         -- enable persistent undo
opt.updatetime = 300                        -- faster completion (4000ms default)
opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.expandtab = true                        -- convert tabs to spaces
opt.shiftwidth = 4                          -- the number of spaces inserted for each indentation
opt.tabstop = 4                             -- insert 4 spaces for a tab
opt.cursorline = true                       -- highlight the current line
opt.number = true                           -- set numbered lines
opt.relativenumber = false                  -- set relative numbered lines
opt.numberwidth = 4                         -- set number column width to 2 {default 4}
opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
opt.wrap = false                            -- display lines as one long line
opt.scrolloff = 8                           -- keep at least 8 lines up and down when moving around
opt.sidescrolloff = 8                       -- keep at least 8 characters left and right when moving around
opt.autoread = true                         -- reload file if modified outside of neovim
opt.hidden = true                           -- hide buffer when switching
opt.foldenable = false                      -- disable folding
opt.showcmd = false                         -- faster over slow SSH
opt.cmdheight = 0                           -- hide command line when not used
opt.laststatus= 3                           -- one global status bar
opt.shell = "/bin/bash"                     -- default shell

opt.shortmess:append("c")                   -- short completion message
opt.whichwrap:append("<,>,[,],h,l")         -- tweak when cursor moves to next line
opt.iskeyword:append("-")                   -- word boundary
opt.listchars:append("space:⋅")             -- show hidden spaces
opt.listchars:append("eol:")               -- show hidden end of line
opt.listchars:append("tab: ")               -- show hidden tabs
opt.fillchars:append("diff: ")              -- replace default '-' en empty line in diff
opt.fillchars:append("eob: ")               -- replace default '~' on empty lines in the buffer
opt.list = true

-- decent starting color scheme
vim.cmd("colorscheme habamax")
vim.cmd("hi VertSplit guifg=NONE guibg=NONE")



