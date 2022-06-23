--- Startup function for the "packer" package manager
-- @param use
--      the tradional "use" function passed in the "startup()"
--      function to kickstart package declaration
-- @param use_with_config
--      an extended "use" function that will automatically add
--      a config function that will execute the configuration
--      found in the "configs" folder. Any plugin declared with
--      this function will expect a corresponding configuration
--      file with file name matching the package name. For
--      instance, if one were to declare a package "acme/foo",
--      this function would expect a configuration file named
--      in "user/configs/foo.lua".
-- @note
--      If a packages has a "." in its name (e.g. "bufferline.nvim"),
--      the expected configuration file should have the same
--      name as the package with all "." are replaced by "-",
--      e.g. "user/configs/bufferline-nvim.lua"
local function startup(use, use_with_config)

    use "wbthomason/packer.nvim"                                    -- manage packer itself when updating
    use "kheaactua/aosp-vim-syntax"                                 -- syntax highlight for Android.bp, XML manifest, AIDL, HIDL, etc.
    use "stevearc/dressing.nvim"                                    -- improved vim.input() and vim.select() used e.g. for LSP renaming
    use "farmergreg/vim-lastplace"                                  -- rememnber position in file when restarting
    use "tpope/vim-fugitive"                                        -- magit style plugin for VIM
    use "valloric/listtoggle"                                       -- toggle quick and location lists
    use "moll/vim-bbye"                                             -- allow to kill buffer without exiting VIM
    use "b0o/schemastore.nvim"                                      -- collection of json schema (used by jsonls)
    use "nvim-lua/plenary.nvim"                                     -- common lua library used by a lot of plugins
    use "svermeulen/vim-cutlass"                                    -- prevent delete and cut operation from poluting the yank register

    use_with_config "lewis6991/impatient.nvim"                      -- profile startup and byte compile what can be
    use_with_config "fedepujol/move.nvim"                           -- move lines around in V mode
    use_with_config "projekt0n/github-nvim-theme"                   -- github colorscheme
    use_with_config "kyazdani42/nvim-web-devicons"                  -- icons for bufferline and others.
    use_with_config "nvim-treesitter/nvim-treesitter"               -- improved syntax hightlighing
    use_with_config "terrortylor/nvim-comment"                      -- toggle comment blocks/lines
    use_with_config "lukas-reineke/indent-blankline.nvim"           -- show indent guides and hidden tabs/space/return
    use_with_config "ntpeters/vim-better-whitespace"                -- hightlight and strip trailing whitespaces
    use_with_config "akinsho/toggleterm.nvim"                       -- improved persistent embedded terminal
    use_with_config "lewis6991/gitsigns.nvim"                       -- display green/red/blue guidelines for git
    use_with_config "windwp/nvim-autopairs"                         -- automativally insert matching pair for parens and quotes
    use_with_config "folke/which-key.nvim"                          -- leader-key based keymap
    use_with_config "mrjones2014/smart-splits.nvim"                 -- allow to resize splits
    use_with_config "stevearc/aerial.nvim"                          -- provide panel with outline of the code
    use_with_config "nvim-lualine/lualine.nvim"                     -- status line at the botton
    use_with_config "sindrets/diffview.nvim"                        -- dedicated tab pane to view the git diffs
    use_with_config "akinsho/bufferline.nvim"                       -- tabs line but for buffers

    -- hook external linters, formatters,... into LSP
    use_with_config {
        "jose-elias-alvarez/null-ls.nvim",
        requires = "nvim-lua/plenary.nvim"
    }

    -- fuzzy finder
    use_with_config {
        "nvim-telescope/telescope.nvim",
        requires = "nvim-lua/plenary.nvim"
    }

    -- side panel file explorer
    use_with_config {
        "nvim-neo-tree/neo-tree.nvim",
        requires = "MunifTanjim/nui.nvim"
    }

    --  use native fzf in telescope (faster)
    use_with_config {
        "nvim-telescope/telescope-fzf-native.nvim",
        require = "nvim-telescope/telescope.nvim",
        run = "make",
    }

    -- add clipboard history search in telescope
    use_with_config {
        "AckslD/nvim-neoclip.lua",
        requires = {
            {"tami5/sqlite.lua", module = "sqlite"},
            {"nvim-telescope/telescope.nvim"},
        }
    }

    -- language server protocol
    use_with_config "neovim/nvim-lspconfig"
    use_with_config {
        "williamboman/nvim-lsp-installer",
        require = "neovim/nvim-lspconfig"
    }

    -- completion engine
    use_with_config "L3MON4D3/LuaSnip"
    use_with_config {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lua",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets"
        },
    }

    -- Debugger Adapter Protocol
    use_with_config 'mfussenegger/nvim-dap'
    use_with_config {
        "rcarriga/nvim-dap-ui",
        requires = {"mfussenegger/nvim-dap"}
    }

    -- TODO(cme): explore "famiu/bufdelete.nvim"
end

-- initialize packer
require("packer").startup {
    function(use)
        local function use_with_config(args)
            if type(args) == "string" then
                args = { args }
            end
            use(vim.tbl_deep_extend("force", args, {
                config = function(name)
                    require("user.configs." .. name:gsub("%.","-"))
                end
            }))
        end
        startup(use, use_with_config)
    end,
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float { border = "rounded" }
            end,
        },
        snapshot = vim.fn.stdpath("config") .. "/lua/user/packer_lock.json"
    }
}

