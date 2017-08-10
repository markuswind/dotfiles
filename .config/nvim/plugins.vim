" vimfiler settings
let g:vimfiler_as_default_explorer  = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_time_format          = ''
let g:vimfiler_ignore_pattern       = ['^\.git$', '^\.DS_Store$']

if !exists(':Es')
  command Es VimFilerSplit
endif

" vim-stay settings
set viewoptions=cursor,folds,slash,unix

" multi cursor settings
let g:multi_cursor_quit_key              = '<C-[>'
let g:multi_cursor_exit_from_insert_mode = 0

" cmd-t settings
nnoremap <C-p> :CommandT<Cr>
let g:CommandTWildIgnore=&wildignore . ",*.pyc,node_modules,build,carthage,coverage,gradle"

" airline settings
set showtabline=2
set laststatus=2
set encoding=utf-8

scriptencoding utf-8

let g:airline_detect_modified            = 0
let g:airline_powerline_fonts            = 1
let g:airline_theme                      ='papercolor'
let g:airline_section_z                  = ''
let g:airline#extensions#tabline#enabled = 1

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

" deocomplete settings
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

" startify settings
let g:startify_custom_header=['  __i                                                     ',
                            \ ' |---|                                                    ',
                            \ ' |[_]|  I`M WAITING IN LINE TO PUNCH PEOPLE WHO ARE       ',
                            \ ' |:::|   WAITING IN LINE TO BE THE FIRST TO BUY AN IPHONE ',
                            \ ' |:::|                                                    ',
                            \ ' `\   \                                                   ',
                            \ '   \_=_\                                                  ',
                            \ '']
