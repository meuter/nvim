return {
    "MysticalDevil/inlay-hints.nvim",
    event = "LspAttach",
    dependencies = { "neovim/nvim-lspconfig" },
    keys = {
        { "<A-i>", "<CMD>InlayHintsToggle<CR>", mode = { "n", "i", "v" } },
    },
    config = function()
        require("inlay-hints").setup()
    end
}
