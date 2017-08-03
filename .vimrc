" plugin manager
call plug#begin('~/.vim/plugged')
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
" utilities
Plug 'moll/vim-bbye'
" Plug 'ap/vim-buftabline'
Plug 'paradigm/vim-multicursor'
Plug 'mhinz/vim-startify'
Plug 'kopischke/vim-stay'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
call plug#end()

" file type settings
filetype plugin indent on

set tabstop=4
set expandtab

autocmd Filetype html  setlocal ts=2 sw=2
autocmd Filetype ruby  setlocal ts=2 sw=2
autocmd Filetype swift setlocal ts=4 sw=4
autocmd Filetype js    setlocal ts=4 sw=4

au BufNewFile,BufRead .* call SetFileTypeSH("bash")
au BufNewFile,BufRead *.swift set filetype=swift

" Theming
syntax enable
colorscheme PaperColor

set background=light
set guifont=Source\ Code\ Pro\ for\ Powerline:h14
let g:Powerline_symbols = 'fancy'

" editor settings
set noeol
set autoread
set ignorecase
set number
set nolist
set nowrap
set showmatch
set cursorline
set noshowmode
set scrolloff=30

" turn off auto indenting
set nocindent
set nosmartindent
set autoindent
set indentexpr=

filetype indent off
filetype plugin indent off

" enable react highlighting for .js extension
let g:jsx_ext_required = 0

" (disabled) enable whitespace indicators
set list
set listchars=tab:▸\ ,trail:·,eol:¬

nmap <leader>l :set list!<CR>

" Jump out of a block of parentheses (uses Delitmate)
imap <C-j> <C-g>g

autocmd VimEnter * silent! autocmd! Explore

" vimfiler settings
let g:vimfiler_as_default_explorer  = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_time_format          = ''

" vim-stay settings
set viewoptions=cursor,folds,slash,unix

" Set wildignores for macvim's file explorer
set wildignore+=.DS_Store,.git
set wildignore+=Carthage/*,node_modules/*

" tab settings
set hidden
nnoremap <C-h> :bprevious<CR>
nnoremap <C-l> :bnext<CR>
nnoremap <C-w> :bdelete<CR>

" disable arrow keys
noremap <Up>    <Nop>
noremap <Down>  <Nop>
noremap <Left>  <Nop>
noremap <Right> <Nop>

" binds for split movement
noremap <Alt-k> :wincmd k<CR>
noremap <Alt-j> :wincmd j<CR>
noremap <Alt-h> :wincmd h<CR>
noremap <Alt-l> :wincmd l<CR>

" cmd-t settings
nnoremap <C-p> :CommandT<Cr>
let g:CommandTWildIgnore=&wildignore . ",*.pyc,node_modules,build,carthage,coverage,gradle"

" airline settings
set laststatus=2
set encoding=utf-8

scriptencoding utf-8

let g:airline_powerline_fonts = 1
let g:airline_theme='papercolor'
let g:airline#extensions#tabline#enabled = 1

" syntastic settings
let g:syntastic_mode_map = {
  \ 'mode': 'active',
  \ 'active_filetypes': ['javascript'],
  \ 'passive_filetypes': []
  \ }

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

" Set centralize backups, swap files and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set shortmess+=A

if exists("&undodir")
  set undodir=~/~dotfiles/.config/vim/undo
endif

" yank to clipboard
if has("clipboard")
  set clipboard=unnamed

  if has("unnamedplus")
    set clipboard+=unnamedplus
  endif
endif

