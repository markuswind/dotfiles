" plugin manager
call plug#begin('~/.config/nvim/plugged')
" file plugins
Plug 'shougo/unite.vim' " used by vimfiler
Plug 'shougo/vimfiler.vim'
Plug 'wincent/command-t', {
    \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
    \ }
" theming plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lilydjwg/colorizer'
Plug 'NLKNguyen/papercolor-theme'
" syntax highlighting
Plug 'sheerun/vim-polyglot'
" autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
" utilities
Plug 'moll/vim-bbye'
Plug 'terryma/vim-multiple-cursors'
Plug 'mhinz/vim-startify'
Plug 'kopischke/vim-stay'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
call plug#end()

" file type settings
filetype plugin indent on

set tabstop=2
set shiftwidth=4
set expandtab

autocmd Filetype html  setlocal ts=2 sw=2
autocmd Filetype ruby  setlocal ts=2 sw=2
autocmd Filetype swift setlocal ts=2 sw=4
autocmd Filetype js    setlocal ts=2 sw=4

au BufNewFile,BufRead .* call SetFileTypeSH("bash")
au BufNewFile,BufRead *.swift set filetype=swift

" theming
syntax enable
colorscheme PaperColor

set background=light
set guifont=Source\ Code\ Pro\ for\ Powerline:h13
set guioptions=aem

" editor settings
set encoding=utf8
set regexpengine=1
set noeol
set autoread
set ignorecase
set nolist
set nowrap
set showmatch
set cursorline
set noshowmode

set number
set relativenumber
set numberwidth=5
set scrolloff=30

" natural splits
set splitbelow
set splitright

" auto indenting
set ai
set si

" enable whitespace indicators
set list
set listchars=tab:▸\ ,trail:·,eol:¬

" jump out of a block of parentheses (uses Delitmate)
imap <C-j> <C-g>g

autocmd VimEnter * silent! autocmd! Explore

" disable swaps + backups
set noswapfile
set nowritebackup
set nobackup

if exists("&undodir")
  call system('mkdir -p ~/dotfiles/.config/nvim/undo')
  set undodir=~/dotfiles/.config/nvim/undo
endif

" yank to clipboard
if has("clipboard")
  set clipboard=unnamed

  if has("unnamedplus")
    set clipboard+=unnamedplus
  endif
endif

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

" tab settings
set hidden

nnoremap <C-h> :bprevious<CR>
nnoremap <C-l> :bnext<CR>

" disable arrow keys
noremap <Up>    <Nop>
noremap <Down>  <Nop>
noremap <Left>  <Nop>
noremap <Right> <Nop>

" commands for split movement
if !exists(':Wk')
  command Wh wincmd h
  command Wj wincmd j
  command Wk wincmd k
  command Wl wincmd l
endif

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
