" auto align, example:
" | a    | b    | c    |
" | 1    | 2    | 3    |
" | 1111 | 2222 | 3333 |
noremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" auto insert cxx header gate
function! s:insert_gates()
    let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
    execute "normal i#ifndef " . gatename
    execute "normal o#define " . gatename . "   "
    execute "normal Go#endif /* " . gatename . " */"
    normal kk
endfunction
autocmd  BufNewFile *.{h,hpp} call <SID>insert_gates()

" auto insert python interpreter
function! s:insert_python_interpreter()
    execute "normal i#!/usr/bin/env python"
    normal kk
endfunction
autocmd BufNewFile *.{py} call <SID>insert_python_interpreter()

" auto insert shell interpreter
function! s:insert_shell_interpreter()
    execute "normal i#!/usr/bin/env bash"
    normal kk
endfunction
autocmd BufNewFile *.{sh} call <SID>insert_shell_interpreter()

" auto insert racket scm interpreter
function! s:insert_scm_interpreter()
    execute "normal i#lang racket"
    normal kk
endfunction
autocmd BufNewFile *.{scm} call <SID>insert_scm_interpreter()
