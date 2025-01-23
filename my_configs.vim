set nu
set pastetoggle=<F3>
:autocmd BufNew,BufRead SConstruct setf python
:autocmd BufNew,BufRead .scons setf python
:autocmd BufNew,BufRead .fishrc setf fish

try
    source ~/.vim_runtime/my_func.vim
    set background=dark
    colorscheme peaksea
catch
endtry


let g:syntastic_cpp_cpplint_exec = 'cpplint'
let g:syntastic_cpp_checkers = ['cpplint', 'gcc']
let g:syntastic_cpp_cpplint_thres = 1
let syntastic_aggregate_errors = 1

let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_error_symbol = '!'
let g:syntastic_style_warning_symbol = '?'

let g:clang_format#command = 'clang-format'
nmap <F4> :ClangFormat<cr>
autocmd FileType c ClangFormatAutoDisable
let g:clang_format#detect_style_file = 1

let g:auto_clean_extra_spaces = 1
