"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theming
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call g:AddPlug('tomasiser/vim-code-dark')
call g:AddPlug('vim-airline/vim-airline', { 'init' : ':AirlineRefresh' })

" Do not display current mode, will be done in status bar
set noshowmode laststatus=2

" Status bar color scheme
let g:airline_theme='codedark'

" Initialize the global config
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif

" Config for the status bar
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#hunks#enabled=0
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.paste = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline#extensions#default#layout = [
    \ [ 'a', 'd', 'b', 'c' ],
    \ [ 'x', 'y', 'z' ]
    \ ]

let g:airline_section_d = ' %{substitute(getcwd(), $HOME, "~", "")}'

" Config for the tab
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

" Clock
call g:AddPlug('enricobacis/vim-airline-clock')
let g:airline#extensions#clock#format = '| %H:%M:%S'
