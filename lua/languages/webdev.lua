-------------------------------------------------------------------------------
-- webdev
-------------------------------------------------------------------------------
local webdev = {
    tools = {
        "typescript-language-server",
        "eslint-lsp",
        "html-lsp",
        "emmet-ls",
        "css-lsp",
    },
    grammars = {
        "javascript",
        "typescript",
        "html",
        "yaml",
        "css",
    }
}

function webdev.on_lspzero_setup()
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
