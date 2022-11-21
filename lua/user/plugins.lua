local function wrap_use_with_default_config(use, config)
    return function(plugin_spec)
        if type(plugin_spec) == "string" then
            plugin_spec = { plugin_spec }
        end
        plugin_spec.config = plugin_spec.config or config
        use(plugin_spec)
    end
end

local function load_config_from_file(plugin_name)
    local package_name = plugin_name:gsub("%.", "-")
    local config_file = vim.fn.stdpath("config") .. "/lua/user/configs/" .. package_name .. ".lua"
    if vim.fn.filereadable(config_file) == 1 then
        require("user.configs." .. plugin_name:gsub("%.", "-"))
    end
end

require("packer").startup {
    function(use)
        use = wrap_use_with_default_config(use, load_config_from_file)

        -- manage packer itself when updating (use unmerged lockfile feature)
        use {
            "EdenEast/packer.nvim",
            branch = "feat/lockfile"
        }

        use "kheaactua/aosp-vim-syntax"             -- syntax highlight for Android.bp, XML manifest, AIDL, HIDL, etc.
        use "stevearc/dressing.nvim"                -- improved vim.input() and vim.select() used e.g. for LSP renaming
        use "ethanholz/nvim-lastplace"              -- rememnber position in file when restarting
        use "b0o/schemastore.nvim"                  -- collection of json schema (used by jsonls)
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
        use "williamboman/mason.nvim"               -- external tool installer

        -- status line at the botton
        use {
            "nvim-lualine/lualine.nvim",
            requires = "nvim-lua/plenary.nvim"
        }

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

        -- improve LSP diagnostic
        use {
            "folke/trouble.nvim",
            requires = "kyazdani42/nvim-web-devicons",
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
        use "MunifTanjim/nui.nvim"
        use {
            "nvim-neo-tree/neo-tree.nvim",
            requires = "MunifTanjim/nui.nvim"
        }

        --  use native fzf in telescope (faster)
        use {
            "nvim-telescope/telescope-fzf-native.nvim",
            require = "nvim-telescope/telescope.nvim",
            run = "make"
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
            requires = "mfussenegger/nvim-dap"
        }

        -- provides completion for Cargo.toml
        use {
            "saecki/crates.nvim",
            requires = "nvim-lua/plenary.nvim"
        }
    end,
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float { border = "rounded" }
            end,
        },
        lockfile = {
            enable = true,
            path = vim.fn.stdpath("config") .. "/lua/user/packer_lock.lua",
            regen_on_update = true,
        },
    }
}
