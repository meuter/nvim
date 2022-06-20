local which_key = require("which-key")

which_key.register({

    f = {
        name = "file",
        e = { "<cmd>NeoTreeFloatToggle<cr>", "File Explorer Panel"},
        f = { "<cmd>ProjectFiles<cr>", "Find File" },
        r = { "<cme>Telescope oldfiles<cr>", "Find Recent File" }
    },
    s = {
        name = "search",
        c = { "<cmd>Telescope neoclip<cr>", "Search Clipboard History" },
        f = { "<cmd>SearchFunction<cr>", "Search Function"},
        l = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
        t = { "<cmd>Todo<cr>", "Search TODOs"},
    },
    g = {
        name = "git",
        b = { "<cmd>G blame<cr>", "Git Blame" },
        d = { "<cmd>DiffviewOpen<cr>", "Git Diff View" },
        f = { "<cmd>Telescope git_bcommits<cr>", "Git File History" },
        l = { "<cmd>Telescope git_commits<cr>", "Git Logs" },
        s = { "<cmd>G<cr><C-w>o", "Git Status" },
    },
    l = {
        name = "lsp",
        i = { "<cmd>LspInstall<cr>", "Install Server" },
        l = { "<cmd>LspInstallInfo<cr>", "LSP List Servers" },
        r = { "<cmd>LspRestart<cr>", "Restart LSP Server" },
        s = { "<cmd>LspInfo<cr>", "LSP Status"},
    },
    n = {
        name = "lsp",
        i = { "<cmd>Navigate<cr>", "Navigate Interactively" },
        c = { "<cmd>cd ~/.config/nvim<cr>", "Navigate to Config"}
    }

    -- TODO(cme): make this modular dependin on what plugin is installed

}, { mode = "n" })
