local function collect_plugins_for_all_languages()
    local plugins = {}
    require("languages").for_each(function(language)
        for _, plugin in ipairs(language) do
            table.insert(plugins, plugin)
        end
    end)
    return plugins
end

return collect_plugins_for_all_languages()
