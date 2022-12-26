-------------------------------------------------------------------------------
-- bash
-------------------------------------------------------------------------------
local bash = {}

function bash.on_mason_install(install)
    install { "bash-language-server" }
end

function bash.on_treesitter_install(install)
    install { "bash" }
end

return bash

