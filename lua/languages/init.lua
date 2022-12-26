local languages = {
    "clang",
    "rust",
    "lua",
    "python",
    "bash",
    "docker",
    "golang",
    "json",
    "yaml",
    "markdown",
    "webdev"
}

function languages.for_each(callback)
    for _, language in ipairs(languages) do
        callback(require("languages." .. language))
    end
end

return languages
