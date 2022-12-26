local languages = {
    "rust",
    "lua"
}

local function for_each_languages(callback)
    for _, language in ipairs(languages) do
        callback(require("plugins.languages." .. language))
    end
end

local function collect_plugins()
    local plugins = {}
    for_each_languages(function(language)
        for _, plugin in ipairs(language) do
            table.insert(plugins, plugin)
        end
    end)
    return plugins
end

local M = collect_plugins()

function M.on_setup_lspzero()
    for_each_languages(function(language)
        language.on_setup_lspzero()
    end)
end

function M.on_mason_install()
    local install = require("mason.api.command").MasonInstall
    for_each_languages(function(language)
        language.on_mason_install(install)
    end)
end

function M.on_treesitter_install()
    local install = require("nvim-treesitter.install").ensure_installed_sync
    for_each_languages(function(language)
        language.on_treesitter_install(install)
    end)
end

return M
