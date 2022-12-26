-------------------------------------------------------------------------------
-- webdev
-------------------------------------------------------------------------------
local webdev = {}

function webdev.on_mason_install(install)
    install {
        "typescript-language-server",
        "eslint-lsp",
        "html-lsp",
        "emmet-ls",
        "css-lsp",
    }
end

function webdev.on_treesitter_install(install)
    install {
        "javascript",
        "typescript",
        "html",
        "yaml",
        "css",
    }
end

function webdev.on_setup_lspzero()
    require("lsp-zero").configure("eslint", {
        root_dir = function()
            return vim.loop.cwd()
        end,
        handlers = {
            ["eslint/probeFailed"] = function()
                return {}
            end,
            ["eslint/noLibrary"] = function()
                return {}
            end,
        },
    })
end

return webdev
