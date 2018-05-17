let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#disable_auto_complete = 1

let g:deoplete#max_menu_width = 0
let g:deoplete#max_list = 12

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
