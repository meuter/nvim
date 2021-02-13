call g:AddPlug('christianchiarulli/nvcode-color-schemes.vim')
call g:AddPlug('nvim-treesitter/nvim-treesitter', { 'init': ':call g:ConfigureTreeSitter()"' })

function! g:ConfigureTreeSitter()
    " configure treesitter
    lua << EOF
	require'nvim-treesitter.configs'.setup {
	  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	  highlight = {
	    enable = true,  -- false will disable the whole extension
	    disable = { },  -- list of language that will be disabled
	  },
	}
EOF

    " configure nvcode-color-schemes
    let g:nvcode_termcolors=256

    syntax on
    colorscheme nvcode

    " checks if your terminal has 24-bit color support
    if (has("termguicolors"))
        set termguicolors
        hi LineNr ctermbg=NONE guibg=NONE
    endif
endfunction
