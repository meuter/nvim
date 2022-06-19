local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
    vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', packer_path })
    vim.cmd "packadd packer.nvim"
end

require("packer").startup {
    function(use)
        local function use_with_config(args)
            if type(args) == "string" then
                args = { args }
            end
            use(vim.tbl_deep_extend("force", args, {
                config = function(name)
                    require("drvim.configs." .. name:gsub("%.","-"))
                end
            }))
        end
        require("drvim.plugins")(use, use_with_config)
    end,
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float { border = "rounded" }
            end,
        },
        snapshot = vim.fn.stdpath("config") .. "/lua/drvim/drvim.json"
    }
}
