local which_key = require("which-key")

which_key.register({
    f = {
        name = "file",
        f = { "<cmd>ProjectFiles<cr>", "Find File" },
        e = { "<cmd>NeoTreeFloatToggle<cr>", "File Explorer Panel"}
    },
    g = {
        name = "git",
        s = { "<cmd>G<cr><C-w>o", "Git Status" },
        d = { "<cmd>DiffviewOpen<cr>", "Git Diff View" },
        f = { "<cmd>Telescope git_bcommits<cr>", "Git File History" },
        l = { "<cmd>Telescope git_commits<cr>", "Git Logs" },
        b = { "<cmd>G blame<cr>", "Git Blame" },
    }
    -- TODO(cme): review and add some more
    -- TODO(cme): make this modular dependin on what plugin is installed
}, { mode = "n" })
