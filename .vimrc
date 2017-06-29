" plugin manager
call plug#begin('~/.vim/plugged')
" file plugins
Plug 'shougo/unite.vim' " used by vimfiler
Plug 'shougo/vimfiler.vim'
Plug 'ctrlpvim/ctrlp.vim'
" theming plugins
Plug 'zefei/cake16'
Plug 'lilydjwg/colorizer'
Plug 'itchyny/lightline.vim'
Plug 'NLKNguyen/papercolor-theme'
" syntax coloring
Plug 'sheerun/vim-polyglot'
" utilities
Plug 'moll/vim-bbye'
Plug 'mhinz/vim-startify'
Plug 'kopischke/vim-stay'
" Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
call plug#end()
filetype plugin indent on

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
colorscheme cake16 " PaperColor

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

" Disable arrow keys
noremap <Up>    <NOP>
noremap <Down>  <NOP>
noremap <Left>  <NOP>
noremap <Right> <NOP>

" Jump out of a block of parentheses (uses Delitmate)
imap <C-j> <C-g>g

autocmd VimEnter * silent! autocmd! Explore

" vimfiler settings
let g:vimfiler_as_default_explorer  = 1
let g:vimfiler_safe_mode_by_default = 0

" vim-stay settings
set viewoptions=cursor,folds,slash,unix

" Set wildignores for macvim's file explorer
set wildignore+=.DS_Store,.git
set wildignore+=Carthage/*,node_modules/*

" tab settings
set hidden
nnoremap <C-h> :tabprev<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-w> :tabclose<CR>

" ctrlp settings
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](doc|tmp|node_modules|build|gradle)',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" lightline settings
set laststatus=2
set encoding=utf-8

scriptencoding utf-8

let g:lightline = {
      \ 'colorscheme': 'PaperColor',
      \ 'component': {
      \   'readonly': '%{&readonly?"#":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

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

