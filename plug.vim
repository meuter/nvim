"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin manager
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:list_of_plugs = []
let s:vimconfig = has('nvim') ? '~/.config/nvim/' : '~/.vim/'
let s:vimrc     = has('nvim') ? s:vimconfig . 'init.vim' : '~/.vimrc'
let s:plugged   = s:vimconfig . 'plugged'

function! g:BootstrapPlugs()
    let l:plugpath  = s:vimconfig . 'autoload/plug.vim'
    let l:plugurl   = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

    " install vim-plug if necessary
    if empty(glob(l:plugpath))
        execute 'silent !curl -fLo ' . l:plugpath . ' --create-dirs ' . l:plugurl
    endif

    " load all of the listed plugin
    call plug#begin(s:plugged)
    for p in s:list_of_plugs
        if len(p) == 1
            Plug p[0]
        endif
        if len(p) == 2
            Plug p[0], p[1]
        endif
    endfor
    call plug#end()

    " auto install on startup if missing plugin
    if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
        autocmd VimEnter * PlugInstall --sync | q | exec 'source ' . s:vimrc
    endif
    
    " trigger the 'init' hook
    for p in s:list_of_plugs
        if len(p) == 2 && has_key(p[1], 'init')
            execute 'silent! ' . get(p[1], 'init')
        endif
    endfor
endfunction

function! g:AddPlug(...)
    let s:list_of_plugs = add(s:list_of_plugs, a:000)
endfunction


