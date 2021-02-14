"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git Integration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call g:AddPlug('tpope/vim-fugitive')
call g:AddPlug('mhinz/vim-signify')

" ctrl+g to toggle the git status window
nnoremap <silent><C-G> :botright Git<CR>
autocmd FileType fugitive nmap <silent><buffer> <C-G> :q<CR>

" 'cc' to commit in git view
autocmd FileType fugitive nmap <silent><buffer> cc :q<bar>:botright Git commit --quiet<CR>

" ctrp+p automatically quits git view
autocmd Filetype fugitive nmap <silent><buffer> <C-P> :q<bar><CR><C-P>

" use = to toggle fold in git commit view
autocmd Filetype git nmap <silent><buffer> = za

" gutter symbol when character changes
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'


