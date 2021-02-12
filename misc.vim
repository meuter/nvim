"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscelaneous
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrl+shift+/ to toggle comments
call g:AddPlug('tpope/vim-commentary')
vmap <C-_> gcc<Esc><Esc>
nmap <C-_> gcc<Esc><Esc>
imap <C-_> <C-\><C-N>gcc<Esc><Esc>i

" multiple cursor with ctrl+n/x/p
call g:AddPlug('terryma/vim-multiple-cursors')

" move lines with alt+j/k
call g:AddPlug('matze/vim-move')

" Remember cursor position when editing a file
call g:AddPlug('https://github.com/farmergreg/vim-lastplace')


