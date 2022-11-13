require("mason-null-ls").setup({
    automatic_setup = true,
})

require("mason-null-ls").setup_handlers({
    function(source_name, methods)
        require("mason-null-ls.automatic_setup")(source_name, methods)
    end,
})
