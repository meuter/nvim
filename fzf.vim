"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command Pallette
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call g:AddPlug('junegunn/fzf', { 'dir': '~/.config/nvim/fzf', 'do': './install --bin' })
call g:AddPlug('junegunn/fzf.vim')

" Use a floating pane at the top like in VSCode
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

function! FloatingFZF()
    let buf = nvim_create_buf(v:false, v:true)
    call setbufvar(buf, '&signcolumn', 'no')

    let height = float2nr(20)
    let width = float2nr(120)
    let horizontal = float2nr((&columns - width) / 2)
    let vertical = 1

    let opts = { 
        \ 'relative': 'editor', 'row': vertical,
        \ 'col': horizontal, 'width': width,
        \ 'height': height, 'style': 'minimal' }

    call nvim_open_win(buf, v:true, opts)
endfunction

" Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Empty value to disable preview window altogether
let g:fzf_preview_window = ''

command! -bang Commits call fzf#vim#commits({'options': '--no-preview'}, <bang>0)

nnoremap <silent> <C-P> :Files<cr>
inoremap <silent> <C-P> <Esc>:Files<CR>
vnoremap <silent> <C-P> <Esc>:Files<CR>

nnoremap <silent> <C-A-P> :Commands<CR>
inoremap <silent> <C-A-P> <Esc>:Commands<CR>
vnoremap <silent> <C-A-P> <Esc>:Commands<CR>

nnoremap <silent> <C-Space> :Buffers<CR>
vnoremap <silent> <C-Space> <Esc>:Buffers<CR>
inoremap <silent> <C-Space> <Esc>:Buffers<CR>


