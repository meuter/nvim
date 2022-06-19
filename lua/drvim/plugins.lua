--- Startup function for the 'packer' package manager
-- @param use
--      the tradional 'use' function passed in the 'startup()'
--      function to kickstart package declaration
-- @param use_with_config
--      an extended 'use' function that will automatically add
--      a config function that will execute the configuration
--      found in the 'configs' folder. Any plugin declared with
--      this function will expect a corresponding configuration
--      file with file name matching the package name. For
--      instance, if one were to declare a package 'acme/foo',
--      this function would expect a configuration file named
--      in "drvim/configs/foo.lua".
-- @note
--      If a packages has a "." in its name (e.g. "bufferline.nvim"),
--      the expected configuration file should have the same
--      name as the package with all "." are replaced by "-",
--      e.g. 'drvim/configs/bufferline-nvim.lua'
return function(use, use_with_config)

    use "wbthomason/packer.nvim"                                    -- manage packer itself when updating
    use "kheaactua/aosp-vim-syntax"                                 -- syntax highlight for Android.bp, XML manifest, AIDL, HIDL, etc.
    use "stevearc/dressing.nvim"                                    -- improved vim.input() and vim.select() used e.g. for LSP renaming
    use "nvim-lua/popup.nvim"                                       -- an implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim"                                     -- useful lua functions used by lots of plugins
    use "farmergreg/vim-lastplace"                                  -- rememnber position in file when restarting
    use "tpope/vim-fugitive"                                        -- magit style plugin for VIM
    use "fedepujol/move.nvim"                                       -- move lines around in V mode
    use "MunifTanjim/nui.nvim"                                      -- ui framework used by neo-tree
    use "valloric/listtoggle"                                       -- toggle quick and location lists
    use "moll/vim-bbye"                                             -- allow to kill buffer without exiting VIM
    use "JoosepAlviste/nvim-ts-context-commentstring"               -- select comment string based on TS parser

    use_with_config "projekt0n/github-nvim-theme"                   -- github colorscheme
    use_with_config "kyazdani42/nvim-web-devicons"                  -- icons for bufferline and others.
    use_with_config "nvim-treesitter/nvim-treesitter"               -- improved syntax hightlighing
    use_with_config "terrortylor/nvim-comment"                      -- toggle comment blocks/lines
    use_with_config "lukas-reineke/indent-blankline.nvim"           -- show indent guides and hidden tabs/space/return
    use_with_config "ntpeters/vim-better-whitespace"                -- hightlight and strip trailing whitespaces
    use_with_config "akinsho/toggleterm.nvim"                       -- improved persistent embedded terminal
    use_with_config "lewis6991/gitsigns.nvim"                       -- display green/red/blue guidelines for git
    use_with_config "windwp/nvim-autopairs"                         -- automativally insert matching pair for parens and quotes


    -- tabs line but for buffers
    use_with_config {
        "akinsho/bufferline.nvim",
        require = "kyazdani42/nvim-web-devicons"
    }

    -- side panel file explorer
    use_with_config {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons",
            "MunifTanjim/nui.nvim"
        },
    }

    -- status line at the botton
    use_with_config {
        "nvim-lualine/lualine.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons"
        }
    }

    -- dedicated tab pane to view the git diffs
    use_with_config {
        "sindrets/diffview.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons"
        }
    }

    -- telescope...
    use_with_config {
        "nvim-telescope/telescope.nvim",
        requires = "nvim-lua/plenary.nvim",
    }

    -- ... with fzf extension
    use_with_config {
        "nvim-telescope/telescope-fzf-native.nvim",
        require = "nvim-telescope/telescope.nvim",
        run = "make",
    }

    -- language server protocol
    use_with_config "neovim/nvim-lspconfig"
    use_with_config {
        "williamboman/nvim-lsp-installer",
        require = "neovim/nvim-lspconfig"
    }

    -- completion engine
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
        },
    }
end
