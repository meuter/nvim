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
    use "wbthomason/packer.nvim"
    use "projekt0n/github-nvim-theme"
    use "kyazdani42/nvim-web-devicons"
    use "nvim-treesitter/nvim-treesitter"
    use "akinsho/bufferline.nvim"
end

