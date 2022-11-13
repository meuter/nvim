require("user.utils.packer_utils").startup {
    function(use)
        use "wbthomason/packer.nvim"                -- manage packer itself when updating
        use "kheaactua/aosp-vim-syntax"             -- syntax highlight for Android.bp, XML manifest, AIDL, HIDL, etc.
        use "stevearc/dressing.nvim"                -- improved vim.input() and vim.select() used e.g. for LSP renaming
        use "ethanholz/nvim-lastplace"              -- rememnber position in file when restarting
        use "b0o/schemastore.nvim"                  -- collection of json schema (used by jsonls)
        use "nvim-lua/plenary.nvim"                 -- common lua library used by a lot of plugins
        use "gbprod/cutlass.nvim"                   -- prevent delete and cut operation from poluting the yank register
        use "moll/vim-bbye"                         -- allow to kill buffer without exiting VIM
        use "fedepujol/move.nvim"                   -- move lines around in V mode
        use "rmehri01/onenord.nvim"                 -- nord colorscheme
        use "kyazdani42/nvim-web-devicons"          -- icons for neotree and others.
        use "terrortylor/nvim-comment"              -- toggle comment blocks/lines
        use "lukas-reineke/indent-blankline.nvim"   -- show indent guides and hidden tabs/space/return
        use "ntpeters/vim-better-whitespace"        -- hightlight and strip trailing whitespaces
        use "akinsho/toggleterm.nvim"               -- improved persistent embedded terminal
        use "lewis6991/gitsigns.nvim"               -- display green/red/blue guidelines for git
        use "windwp/nvim-autopairs"                 -- automativally insert matching pair for parens and quotes
        use "nvim-lualine/lualine.nvim"             -- status line at the botton
        use "williamboman/mason.nvim"               -- external tool installer

        -- improved syntax hightlighing
        use {
            "nvim-treesitter/nvim-treesitter",
            branch = "v0.8.0"
        }


        -- Git interation
        use {
            "sindrets/diffview.nvim",
            requires = {
                "tpope/vim-fugitive",
                "nvim-lua/plenary.nvim"
            }
        }

        -- hook external linters, formatters,... into LSP
        use {
            "jose-elias-alvarez/null-ls.nvim",
            requires = "nvim-lua/plenary.nvim"
        }
        use {
            "jayp0521/mason-null-ls.nvim",
            requires = {
                "williamboman/mason.nvim",
                "jose-elias-alvarez/null-ls.nvim",
            }
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

        -- Language Server Protocol
        use "neovim/nvim-lspconfig"
        use {
            "williamboman/mason-lspconfig.nvim",
            requires = "williamboman/mason.nvim"
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
        use "mfussenegger/nvim-dap"
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
