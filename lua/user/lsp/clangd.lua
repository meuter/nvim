return {
    cmd = {
        "clangd",
        "-j=4",
        "--clang-tidy",
        "--background-index",
        "--suggest-missing-includes",
        "--header-insertion=never",
        "--fallback-style=webkit",
        "--all-scopes-completion",
        "--completion-style=detailed",
        "--pch-storage=memory",
    }
}

