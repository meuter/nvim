local function sign(op, char)
    return {
        hl = "GitSigns" .. op,
        text = char,
        numhl = "GitSigns" .. op .. "Nr",
        linehl = "GitSigns" .. op .. "Ln",
    }
end

return {
    "lewis6991/gitsigns.nvim",
    opts = {
        signs = {
            add = sign("Add", "▎"),
            untracked = sign("Add", "▎"),
            change = sign("Change", "▎"),
            changedelete = sign("Change", "▎"),
            delete = sign("Delete", "▎"),
            topdelete = sign("Delete", "▎"),
        },
    }
}
