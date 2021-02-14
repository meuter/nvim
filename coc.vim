"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Code Completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call g:AddPlug('neoclide/coc.nvim', {'branch': 'release', 'do': ':CocUpdateSync' })

" list extensions
let g:coc_global_extensions = [
    \ 'coc-json', 'coc-python',
    \ 'coc-cmake', 'coc-clangd',
    \ 'coc-vimlsp', 'coc-marketplace',
    \ 'coc-explorer'
    \ ]

" F12 to go to definition
map <silent> <F12> <Plug>(coc-definition)

" F9 to toggle diagnostics for diagnostics
call g:AddPlug('Valloric/ListToggle')

function! g:ToggleDiagnostics()
    call coc#rpc#request('fillDiagnostics', [bufnr('%')])
    execute 'LToggle'
endfunction

map <silent> <F9> :call g:ToggleDiagnostics()<CR>

" Toggle file explorer using Ctrl+b
inoremap <silent> <C-b> <C-\><C-n>:CocCommand explorer<cr>
vnoremap <silent> <C-b> <C-\><C-n>:CocCommand explorer<cr>
tnoremap <silent> <C-b> <C-\><C-n>:CocCommand explorer<cr>
nnoremap <silent> <C-b> :CocCommand explorer<cr>


