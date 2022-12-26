local languages = {
    "clang",
    "rust",
    "lua",
    "python",
    "bash",
    "docker",
    "golang",
    "json",
    "yaml",
    "markdown",
    "webdev"
}

local function for_each_languages(callback)
    for _, language in ipairs(languages) do
        callback(require("plugins.languages." .. language))
    end
end

local function collect_plugins_for_all_languages()
    local plugins = {}
    for_each_languages(function(language)
        for _, plugin in ipairs(language) do
            table.insert(plugins, plugin)
        end
    end)
    return plugins
end

local M = collect_plugins_for_all_languages()

function M.on_setup_lspzero()
    for_each_languages(function(language)
        if language.on_setup_lspzero ~= nil then
            language.on_setup_lspzero()
        end
    end)
end

function M.on_setup_dap()
    for_each_languages(function(language)
        if language.on_setup_dap ~= nil then
            language.on_setup_dap()
        end
    end)
end

function M.on_mason_install()
    local install = require("mason.api.command").MasonInstall
    for_each_languages(function(language)
        if language.on_mason_install ~= nil then
            language.on_mason_install(install)
        end
    end)
end

function M.on_treesitter_install()
    local install = require("nvim-treesitter.install").ensure_installed_sync
    for_each_languages(function(language)
        if language.on_treesitter_install ~= nil then
            language.on_treesitter_install(install)
        end
    end)
end

return M
