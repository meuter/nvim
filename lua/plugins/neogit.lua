return {
    "NeogitOrg/neogit",
    config = function()
        require("neogit").setup({
            commit_editor = {
                kind = "floating",
                spell_check = false,
            },
            mappings = {
                commit_editor = {
                    ["<esc><esc>"] = "Abort",
                    ["<c-c><c-c>"] = "Submit",
                    ["<c-c><c-k>"] = "Abort",
                },
                commit_editor_I = {
                    ["<esc><esc>"] = "Abort",
                    ["<c-c><c-c>"] = "Submit",
                    ["<c-c><c-k>"] = "Abort",
                },
            },
        })
        vim.api.nvim_create_autocmd("User", {
            desc = "Refresh diffview when commit is complete",
            pattern = { "NeogitCommitComplete" },
            group = vim.api.nvim_create_augroup("refresh-diffview-on-commit", { clear = true }),
            callback = function()
                vim.cmd([[ DiffviewRefresh ]])
            end,
        })
    end,
}
