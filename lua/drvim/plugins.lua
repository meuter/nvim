local drvim_config = function(package_name)
    require("drvim.configs." .. package_name)
end

return function(use)
    use {
        "wbthomason/packer.nvim",
    }
    use {
        "projekt0n/github-nvim-theme",
        config = drvim_config
    }
    use {
        "nvim-treesitter/nvim-treesitter",
        config = drvim_config
    }
end

