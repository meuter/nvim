"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscelaneous
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrl+shift+/ to toggle comments
call g:AddPlug('tpope/vim-commentary')
vmap <C-_> gcc<Esc><Esc>
nmap <C-_> gcc<Esc><Esc>
imap <C-_> <C-\><C-N>gcc<Esc><Esc>i

" move lines with alt+j/k
call g:AddPlug('matze/vim-move')

" Remember cursor position when editing a file
call g:AddPlug('https://github.com/farmergreg/vim-lastplace')

" display trailing whitespace
call g:AddPlug('ntpeters/vim-better-whitespace')

" icons for file types
call g:AddPlug('ryanoasis/vim-devicons')

" CTRL-L to toggle quick fix
call g:AddPlug('Valloric/ListToggle')
nnoremap <silent> <C-l> :QToggle<CR>
vnoremap <silent> <C-l> <C-\><-N>:QToggle<CR>
inoremap <silent> <C-l> <C-\><-N>:QToggle<CR>

" When selecting in quickfix/location, open file and close quickfix/location
nnoremap <silent> <expr> <CR> &buftype ==# 'quickfix' ? '<CR>:cclose<CR>:lclose<CR>' : '<CR>'

" Some support for cmake
call g:AddPlug('cdelledonne/vim-cmake')
let g:cmake_link_compile_commands=1
