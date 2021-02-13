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

" ctrl+space for code completion
inoremap <silent><expr> <c-space> coc#refresh()

" F12 to go to definition
map <silent> <F12> <Plug>(coc-definition)



" Explorer
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }

" Toggle file explorer using Ctrl+b
inoremap <silent> <C-b> <C-\><C-n>:CocCommand explorer<cr>
vnoremap <silent> <C-b> <C-\><C-n>:CocCommand explorer<cr>
tnoremap <silent> <C-b> <C-\><C-n>:CocCommand explorer<cr>
nnoremap <silent> <C-b> :CocCommand explorer<cr>

" autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

