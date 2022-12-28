-------------------------------------------------------------------------------
-- lastplace
-------------------------------------------------------------------------------
local lastplace = {
    -- remembers last place in file and return to it afterwards
    "ethanholz/nvim-lastplace",
    config = true,
}

-------------------------------------------------------------------------------
-- cutlass
-------------------------------------------------------------------------------
local cutlass = {
    -- prevent delete and cut operation from poluting the yank register
    "gbprod/cutlass.nvim",
    config = { cut_key = "m", override_del = true }
}

-------------------------------------------------------------------------------
-- move
-------------------------------------------------------------------------------
local move = {
    -- move lines around in V mode
    "fedepujol/move.nvim",
}

function move.init()
    local opts = { noremap = true, silent = true }
    -- Alt+up/down to move lines
    vim.keymap.set("n", "<A-Down>", ":MoveLine(1)<CR>", opts)
    vim.keymap.set("n", "<A-Up>", ":MoveLine(-1)<CR>", opts)
    vim.keymap.set("v", "<A-Down>", ":MoveBlock(1)<CR>", opts)
    vim.keymap.set("v", "<A-Up>", ":MoveBlock(-1)<CR>", opts)
    vim.keymap.set("i", "<A-Down>", "<C-\\><C-N>:MoveLine(1)<CR>i", opts)
    vim.keymap.set("i", "<A-Up>", "<C-\\><C-N>:MoveLine(-1)<CR>i", opts)
end

-------------------------------------------------------------------------------
-- comment
-------------------------------------------------------------------------------
local comment = {
    -- toggle comment blocks/lines
    "terrortylor/nvim-comment"
}

function comment.config()
    require("nvim_comment").setup {}
end

function comment.init()
    -- Ctrl+/ to toggle comment
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<C-_>", "<CMD>CommentToggle<CR>j", opts)
    vim.keymap.set("i", "<C-_>", "<C-\\><C-N><CMD>CommentToggle<CR>ji", opts)
    vim.keymap.set("v", "<C-_>", ":'<,'>CommentToggle<CR>gv<esc>j", opts)
end

-------------------------------------------------------------------------------
-- indent-blankline
-------------------------------------------------------------------------------
local indent_blankline = {
    -- show indent guides and hidden tabs/space/return
    "lukas-reineke/indent-blankline.nvim"
}

function indent_blankline.config()
    vim.g.indent_blankline_char = "▏"
    vim.g.indent_blankline_show_trailing_blankline_indent = false

    require("indent_blankline").setup {
        enabled = true,
        show_trailing_blankline_indent = false,
        show_first_indent_level = true,
        blankline_char = "▏",
        use_treesitter = true,
        buftype_exclude = {
            "terminal",
            "nofile",
        },
        filetype_exclude = {
            "help",
            "startify",
            "dashboard",
            "packer",
            "neogitstatus",
            "NvimTree",
            "Trouble",
        },
        show_end_of_line = true,
        space_char_blankline = " ",
    }
end

-------------------------------------------------------------------------------
-- better-whitespace
-------------------------------------------------------------------------------
local better_whitespace = {
    -- hightlight and strip trailing whitespaces
    "ntpeters/vim-better-whitespace"
}

function better_whitespace.config()
    vim.g.better_whitespace_enabled = 1
    vim.g.strip_whitespace_on_save = 1
    vim.g.strip_whitespace_confirm = 0
    vim.g.better_whitespace_filetypes_blacklist = {
        "terminal",
        "toggleterm",
        "diff",
        "git",
        "gitcommit",
        "unite",
        "qf",
        "help",
        "markdown",
        "fugitive",
    }
end

-------------------------------------------------------------------------------
-- misc
-------------------------------------------------------------------------------
local toggleterm = {
    "akinsho/toggleterm.nvim",
    config = { open_mapping = [[<c-\>]], direction = "tab" }
}

local function prompt_and_replace(old)
    vim.ui.input({ prompt = "Replace '" .. old .. "' with:" }, function(new)
        local cmd = "fd | FZF_DEFAULT_OPTS='--reverse --multi --bind=\"ctrl-a:toggle-all\"' sad '"
            .. old
            .. "' '"
            .. new
            .. "'"
        local terminal = require("toggleterm.terminal").Terminal:new({
            cmd = cmd,
            direction = "float",
        })
        terminal:toggle()
    end)
end

function toggleterm.init()
    -- Ctrl+f to search word under the cursor/selected text
    vim.keymap.set("n", "<C-f>", function()
        local old = vim.fn.expand("<cword>")
        prompt_and_replace(old)
    end)
    vim.keymap.set("v", "<C-f>", function()
        vim.cmd([[ noau normal! "vy" ]])
        local old = string.gsub(vim.fn.getreg("v"), "\n", "")
        prompt_and_replace(old)
    end)
end

-------------------------------------------------------------------------------
-- harpoon
-------------------------------------------------------------------------------
local harpoon = {
    -- manually manage frequently used buffers
    "theprimeagen/harpoon"
}

function harpoon.init()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")
    vim.keymap.set({ "n", "v" }, "<Space><Space>", mark.add_file)
    vim.keymap.set({ "n", "v" }, "<Bslash>", ui.toggle_quick_menu)
    vim.keymap.set({ "n", "v" }, "1", function() ui.nav_file(1) end)
    vim.keymap.set({ "n", "v" }, "2", function() ui.nav_file(2) end)
    vim.keymap.set({ "n", "v" }, "3", function() ui.nav_file(3) end)
    vim.keymap.set({ "n", "v" }, "4", function() ui.nav_file(4) end)
    vim.keymap.set({ "n", "v" }, "5", function() ui.nav_file(5) end)
    vim.keymap.set({ "n", "v" }, "6", function() ui.nav_file(6) end)
    vim.keymap.set({ "n", "v" }, "7", function() ui.nav_file(7) end)
    vim.keymap.set({ "n", "v" }, "8", function() ui.nav_file(8) end)
    vim.keymap.set({ "n", "v" }, "9", function() ui.nav_file(9) end)
    vim.keymap.set({ "n", "v" }, "0", function() ui.nav_file(10) end)
end

function harpoon.config()
    require("harpoon").setup {
        menu = {
            width = math.floor(vim.api.nvim_win_get_width(0) * .5),
            height = math.floor(vim.api.nvim_win_get_height(0) * .4),
            borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        }
    }
end

-------------------------------------------------------------------------------
-- misc
-------------------------------------------------------------------------------
return {
    "kheaactua/aosp-vim-syntax",
    lastplace,
    cutlass,
    move,
    comment,
    indent_blankline,
    better_whitespace,
    toggleterm,
    harpoon,
}
