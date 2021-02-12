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
set nofoldenable    								  " disable folding

" Esc-Esc to remove highlight
nnoremap <esc><esc> :silent! nohls<cr>

" Keeps tabls for Makefile
filetype plugin indent on
autocmd FileType make setlocal noexpandtab

