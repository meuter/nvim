local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
    vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', packer_path })
    vim.cmd "packadd packer.nvim"
end

local function startup(use)
    use {
        "wbthomason/packer.nvim",
    }
end

require("packer").startup {
    startup,
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float { border = "rounded" }
            end,
        }
    }
}

