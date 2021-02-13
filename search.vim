function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction


nnoremap <expr> <CR> &buftype ==# 'quickfix' ? "<CR>:call ToggleQuickFix()<CR>" : '<CR>'

nnoremap <silent> <C-l> :call ToggleQuickFix()<cr>
