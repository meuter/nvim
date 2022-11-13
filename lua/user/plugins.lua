require("user.utils.packer_utils").startup {
    function(use)
        use "wbthomason/packer.nvim"                -- manage packer itself when updating
        use "kheaactua/aosp-vim-syntax"             -- syntax highlight for Android.bp, XML manifest, AIDL, HIDL, etc.
        use "stevearc/dressing.nvim"                -- improved vim.input() and vim.select() used e.g. for LSP renaming
        use "farmergreg/vim-lastplace"              -- rememnber position in file when restarting
        use "tpope/vim-fugitive"                    -- magit style plugin for VIM
        use "valloric/listtoggle"                   -- toggle quick and location lists
        use "b0o/schemastore.nvim"                  -- collection of json schema (used by jsonls)
        use "nvim-lua/plenary.nvim"                 -- common lua library used by a lot of plugins
        use "gbprod/cutlass.nvim"                   -- prevent delete and cut operation from poluting the yank register
        use "moll/vim-bbye"                         -- allow to kill buffer without exiting VIM
        use "fedepujol/move.nvim"                   -- move lines around in V mode
        use "rmehri01/onenord.nvim"                 -- nord colorscheme
        use "kyazdani42/nvim-web-devicons"          -- icons for bufferline and others.
        use "nvim-treesitter/nvim-treesitter"       -- improved syntax hightlighing
        use "terrortylor/nvim-comment"              -- toggle comment blocks/lines
        use "lukas-reineke/indent-blankline.nvim"   -- show indent guides and hidden tabs/space/return
        use "ntpeters/vim-better-whitespace"        -- hightlight and strip trailing whitespaces
        use "akinsho/toggleterm.nvim"               -- improved persistent embedded terminal
        use "lewis6991/gitsigns.nvim"               -- display green/red/blue guidelines for git
        use "windwp/nvim-autopairs"                 -- automativally insert matching pair for parens and quotes
        use "mrjones2014/smart-splits.nvim"         -- allow to resize splits
        use "nvim-lualine/lualine.nvim"             -- status line at the botton
        use "sindrets/diffview.nvim"                -- dedicated tab pane to view the git diffs
        use "akinsho/bufferline.nvim"               -- tabs line but for buffers
        use "williamboman/mason.nvim"               -- external tool installer

        -- hook external linters, formatters,... into LSP
        use {
            "jose-elias-alvarez/null-ls.nvim",
            requires = "nvim-lua/plenary.nvim"
        }

        -- fuzzy finder
        use {
            "nvim-telescope/telescope.nvim",
            requires = "nvim-lua/plenary.nvim"
        }

        -- side panel file explorer
        use {
            "nvim-neo-tree/neo-tree.nvim",
            requires = "MunifTanjim/nui.nvim"
        }

        --  use native fzf in telescope (faster)
        use {
            "nvim-telescope/telescope-fzf-native.nvim",
            require = "nvim-telescope/telescope.nvim",
            run = "make",
        }

        -- add clipboard history search in telescope
        use {
            "AckslD/nvim-neoclip.lua",
            requires = {
                { "tami5/sqlite.lua", module = "sqlite" },
                { "nvim-telescope/telescope.nvim" },
            }
        }

        -- language server protocol
        use "neovim/nvim-lspconfig"
        use {
            "williamboman/nvim-lsp-installer",
            require = "neovim/nvim-lspconfig"
        }

        -- completion engine
        use "L3MON4D3/LuaSnip"
        use {
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
        use 'mfussenegger/nvim-dap'
        use {
            "rcarriga/nvim-dap-ui",
            requires = { "mfussenegger/nvim-dap" }
        }

        -- provides completion for Cargo.toml
        use {
            "saecki/crates.nvim",
            requires = "nvim-lua/plenary.nvim"
        }
    end
}
