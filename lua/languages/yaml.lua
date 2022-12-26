-------------------------------------------------------------------------------
-- YAML
-------------------------------------------------------------------------------
local yaml = {}

function yaml.on_mason_install(install)
    install { "yaml-language-server" }
end

function yaml.on_treesitter_install(install)
    install({ "yaml" })
end

return yaml
