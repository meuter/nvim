"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some sensible defaults
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab smarttab shiftwidth=4 tabstop=4         " tabs expand to 4 spaces
set number signcolumn=yes cursorline                  " line numbers and highlight currentline
set autoread nobackup nowb noswapfile                 " auto reload and avoid backups
set hlsearch ignorecase smartcase incsearch wrapscan  " improved inline search
set nowrap                                            " don't wrap lines
set hidden                                            " hide buffer when switching
set mouse=a                                           " mouse integration
set updatetime=300                                    " improve responsiveness
set pastetoggle=<F2>                                  " toggle paste mode using <F2>
set nofoldenable    				                  " disable folding
set scrolloff=7                                       " when scrolling keeps some lines at the top/bottom
set backspace=indent,eol,start                        " backspace works even beyond eol

" turn on syntax hightlighting
syntax on

" Esc-Esc to remove highlight
nnoremap <silent> <esc><esc> :nohls<cr>

" Keeps tabls for Makefile
filetype plugin indent on
autocmd FileType make setlocal noexpandtab

" When switching back to Normal mode from Insert mode
" prevent the cursor from moving to the left, grrr
inoremap <Esc> <Esc><Right>

" use the 0 register for copy paste
" (avoid being overwritten by x, d, ciw, etc.)
vnoremap y "0y
vnoremap Y "0Y
vnoremap p "0p
vnoremap P "0P
