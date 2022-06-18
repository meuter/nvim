local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
    vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', packer_path })
    vim.cmd "packadd packer.nvim"
end

require("packer").startup {
    function(use)
        local function use_and_configure(package_name)
            use {
                package_name,
                config = function(name)
                    require("drvim.configs." .. name:gsub("%.","-"))
                end
            }
        end
        require("drvim.plugins")(use_and_configure)
    end,
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float { border = "rounded" }
            end,
        }
    }
}
