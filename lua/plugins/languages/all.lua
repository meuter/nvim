local languages = {
    "clang",
    -- "rust",
    -- "lua",
    -- "python",
    -- "bash",
    -- "docker",
    -- "golang",
    -- "json",
    -- "yaml",
    -- "markdown",
    -- "webdev"
}

local M = {}

function M.for_each_languages(callback)
    for _, language in ipairs(languages) do
        callback(require("plugins.languages." .. language))
    end
end

function M.on_setup_lspzero()
    M.for_each_languages(function(language)
        if language.on_setup_lspzero ~= nil then
            language.on_setup_lspzero()
        end
    end)
end

function M.on_setup_dap()
    M.for_each_languages(function(language)
        if language.on_setup_dap ~= nil then
            language.on_setup_dap()
        end
    end)
end

function M.on_mason_install()
    local install = require("mason.api.command").MasonInstall
    M.for_each_languages(function(language)
        if language.on_mason_install ~= nil then
            language.on_mason_install(install)
        end
    end)
end

function M.on_treesitter_install()
    local install = require("nvim-treesitter.install").ensure_installed_sync
    M.for_each_languages(function(language)
        if language.on_treesitter_install ~= nil then
            language.on_treesitter_install(install)
        end
    end)
end

return M
