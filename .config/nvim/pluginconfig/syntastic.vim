" syntastic settings
let g:syntastic_mode_map = {
  \ 'mode':              'passive',
  \ 'active_filetypes':  [],
  \ 'passive_filetypes': ['javascript']
  \ }

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 1
let g:syntastic_check_on_open            = 1
let g:syntastic_check_on_wq              = 0
let g:syntastic_javascript_checkers      = ['eslint']

" see :h syntastic-loclist-callback
" limits size of syntastic split
function! SyntasticCheckHook(errors)
    if !empty(a:errors)
        let g:syntastic_loc_list_height = min([len(a:errors), 10])
    endif
endfunction
