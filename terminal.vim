"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Embedded Terminal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call g:AddPlug('kassio/neoterm')

let g:neoterm_default_mod="botright"
let g:neoterm_autoinsert=1

nnoremap <silent> <C-J> :Ttoggle<CR>
inoremap <silent> <C-J> <C-\><C-N>:Ttoggle<CR>
vnoremap <silent> <C-J> <C-\><C-N>:Ttoggle<CR>
tnoremap <silent> <C-J> <C-\><C-N>:Ttoggle<CR>
tnoremap <silent> <C-W><esc> <C-\><C-N>
