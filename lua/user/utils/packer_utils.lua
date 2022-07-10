local M = {}

function M.list_installed_plugins_paths()
    local opt, start = require("packer.plugin_utils").list_installed_plugins()
    local installed = vim.tbl_deep_extend("error", opt, start)
    local result = {}

    for plugin_path, plugin_installed in pairs(installed) do
        if plugin_installed then
            table.insert(result, plugin_path)
        end
    end

    return result
end

function M.get_plugin_revision(plugin_path)
    local command = "GIT_DIR=" .. plugin_path .. "/.git git rev-parse HEAD"
    local git_handle = assert(io.popen(command, 'r'))
    local revision = assert(git_handle:read('*a'))
    git_handle:close()
    revision = string.gsub(revision, '[\n\r]+', '')
    return revision
end

function M.extract_plugin_name_from_path(plugin_path)
    local plugin_name = nil
    for match in plugin_path:gmatch("([^/]+)") do
        plugin_name = match
    end
    return plugin_name
end

function M.get_pinned_commit_for_plugin(plugin_path)
    local packer_lock = require("user.packer_lock")
    local plugin_name = M.extract_plugin_name_from_path(plugin_path)
    return packer_lock[plugin_name]
end

return M
