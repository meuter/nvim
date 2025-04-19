return {
    settings = {
        clangd = {
            InlayHints = {
                Designators = true,
                Enabled = true,
                ParameterNames = true,
                DeducedTypes = true,
            },
        },
        fallbackFlags = { "-std=c++20" },
    },
    cmd = {
        "clangd",
        "-j=4",
        "--clang-tidy",
        "--background-index",
        "--header-insertion=never",
        "--fallback-style=webkit",
        "--all-scopes-completion",
        "--completion-style=detailed",
        "--pch-storage=memory",
    },
}
