"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Explorer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call g:AddPlug('preservim/nerdtree')
call g:AddPlug('vwxyutarooo/nerdtree-devicons-syntax')

" Focus on most used filetype for efficiency
let g:NERDTreeLimitedSyntax = 1

" Automatically close NT when file is opened
let NERDTreeQuitOnOpen=1

" Toggle file explorer using Ctrl+b
inoremap <silent> <C-b> <C-\><C-n>:NERDTreeToggle<cr>
vnoremap <silent> <C-b> <C-\><C-n>:NERDTreeToggle<cr>
tnoremap <silent> <C-b> <C-\><C-n>:NERDTreeToggle<cr>
nnoremap <silent> <C-b> :NERDTreeToggle<cr>

" Allow ctrl+j to open neoterm even when NERDTree is focussed
function! NERDTreeToggleTerminal()
    execute ":Ttoggle"
endfunction

function! NERDTreeCustomKeyBindings()
    try
        call NERDTreeAddKeyMap({
          \ 'key': '<C-J>',
          \ 'callback': 'NERDTreeToggleTerminal',
          \ 'quickhelpText': 'toggle embedded terminal' })
    catch
    endtry
endfunction

autocmd VimEnter * call NERDTreeCustomKeyBindings()


