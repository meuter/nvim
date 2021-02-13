function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction

" when hitting enter in quickfix, open file and close quickfix
nnoremap <expr> <CR> &buftype ==# 'quickfix' ? "<CR>:call ToggleQuickFix()<CR>" : '<CR>'

" CTRL+L to toggle quickfix
nnoremap <silent> <C-l> :call ToggleQuickFix()<cr>
