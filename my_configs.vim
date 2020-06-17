
set nu
set pastetoggle=<F3>
:autocmd BufNew,BufRead SConstruct setf python

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
autocmd FileType c ClangFormatAutoEnable
let g:clang_format#detect_style_file = 1
