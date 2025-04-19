return {
    settings = {
        Lua = {
            completion = { callSnippet = "Replace" },
            diagnostics = { globals = { "vim" } },
            telemetry = { enable = false },
            workspace = { checkThirdParty = false },
            hint = { enable = true },
        },
    },
}
