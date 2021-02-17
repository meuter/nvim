"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command Pallette
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call g:AddPlug('junegunn/fzf', { 'dir': '~/.config/nvim/fzf', 'do': './install --bin' })
call g:AddPlug('meuter/fzf.vim')

" Use a floating pane at the top like in VSCode
let g:fzf_layout = { 'window': 'call FloatingFZF()' }
function! FloatingFZF()
    let buf = nvim_create_buf(v:false, v:true)
    call setbufvar(buf, '&signcolumn', 'no')

    let height = float2nr(10)
    let width = float2nr(120)
    let horizontal = float2nr((&columns - width) / 2)
    let vertical = 1

    let opts = {
        \ 'relative': 'editor', 'row': vertical,
        \ 'col': horizontal, 'width': width,
        \ 'height': height, 'style': 'minimal' }

    call nvim_open_win(buf, v:true, opts)
endfunction

" Ignore content if .git and gitignored files
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Empty value to disable preview window altogether
let g:fzf_preview_window = ''

" map CTRL+P to open file box
nnoremap <silent> <C-P> :Files<cr>
inoremap <silent> <C-P> <C-\><C-N>:Files<CR>
vnoremap <silent> <C-P> <C-\><C-N>:Files<CR>
