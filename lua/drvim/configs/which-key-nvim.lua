local which_key = require("which-key")

which_key.register({
    f = {
        name = "file",
        f = { "<cmd>ProjectFiles<cr>", "Find File" },
        e = { "<cmd>NeoTreeFloatToggle<cr>", "File Explorer Panel"}
    },
    s = {
        name = "search",
        l = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
        f = { "<cmd>SearchFunction<cr>", "Search Function"},
        t = { "<cmd>Todo<cr>", "Search TODOs"}
    },
    g = {
        name = "git",
        s = { "<cmd>G<cr><C-w>o", "Git Status" },
        d = { "<cmd>DiffviewOpen<cr>", "Git Diff View" },
        f = { "<cmd>Telescope git_bcommits<cr>", "Git File History" },
        l = { "<cmd>Telescope git_commits<cr>", "Git Logs" },
        b = { "<cmd>G blame<cr>", "Git Blame" },
    },
    l = {
        name = "lsp",
        i = { "<cmd>LspInstall<cr>", "Install Server" },
        r = { "<cmd>LspRestart<cr>", "Restart LSP Server" },
        s = { "<cmd>LspInfo<cr>", "LSP Status"},
        l = { "<cmd>LspInstallInfo<cr>", "LSP List Servers" }
    }
    -- TODO(cme): review and add some more
    -- TODO(cme): make this modular dependin on what plugin is installed
}, { mode = "n" })
