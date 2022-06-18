--
-- Note that the 'use' function here is not the original packer
-- 'use' function. It is a function that automatically loads the
-- plugin and its configuration from the 'configs' folder. For
-- instance for package 'foo', a configuration file is expected
-- in 'drvim/configs/foo.lua'.
--
-- Some packages have a '.' in their name (e.g. 'bufferline.nvim'),
-- in which case the expected configuration file should have the
-- same name as the package name except that '.' are replaced by
-- '-', this to avoid any lua import problems.
--

return function(use)
    use "wbthomason/packer.nvim"                -- manage packer itself when updating
    use "nvim-lua/popup.nvim"                   -- an implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim"                 -- useful lua functions used by lots of plugins
    use "projekt0n/github-nvim-theme"           -- github colorscheme
    use "kyazdani42/nvim-web-devicons"          -- icons for bufferline and others.
    use "nvim-treesitter/nvim-treesitter"       -- improved syntax hightlighing
    use "farmergreg/vim-lastplace"              -- rememnber position in file when restarting
    use "valloric/listtoggle"                   -- toggle quick and location lists
    use "fedepujol/move.nvim"                   -- move lines around in V mode
    use "kheaactua/aosp-vim-syntax"             -- syntax highlight for Android.bp, XML manifest, AIDL, HIDL, etc.
    use "MunifTanjim/nui.nvim"                  -- ui framework used by neo-tree

    -- tabs line but for buffers
    use {
        "akinsho/bufferline.nvim",
        require = "kyazdani42/nvim-web-devicons"
    }

    -- side panel file explorer
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons",
            "MunifTanjim/nui.nvim"
        },
    }

    -- status line at the botton
    use {
        "nvim-lualine/lualine.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons"
        }
    }

end

