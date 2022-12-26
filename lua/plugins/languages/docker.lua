-------------------------------------------------------------------------------
-- docker
-------------------------------------------------------------------------------
local docker = {}

function docker.on_mason_install(install)
    install { "dockerfile-language-server" }
end

function docker.on_treesitter_install(install)
    install { "dockerfile" }
end

return docker
