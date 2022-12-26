-------------------------------------------------------------------------------
-- markdown
-------------------------------------------------------------------------------
local markdown = {}

function markdown.on_mason_install(install)
    install {
        "remark-language-server",
    }
end

function markdown.on_treesitter_install(install)
    install {
        "markdown",
        "markdown_inline"
    }
end

return markdown
