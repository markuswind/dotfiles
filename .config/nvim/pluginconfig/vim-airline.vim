set showtabline=2
set laststatus=2

scriptencoding utf-8

let g:airline_detect_modified = 0
let g:airline_powerline_fonts = 1
let g:airline_theme ='papercolor'
let g:airline_section_z = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline_skip_empty_sections = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.branch= ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''

" backup icons:    
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let airline#extensions#ale#error_symbol = ' '
let airline#extensions#ale#warning_symbol = ' '
