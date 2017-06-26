set nrformats=
set autoread
set ignorecase

" Set centralize backups, swap files and undo history
set clipboard=unnamedplus

set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set shortmess+=A

if exists("&undodir")
  set undodir=~/~dotfiles/.config/vim/undo
endif

" plugin manager
call plug#begin('~/.vim/plugged')
Plug 'VundleVim/Vundle.vim'
Plug 'moll/vim-bbye'
Plug 'chriskempson/base16-vim'
Plug 'Shougo/unite.vim'
Plug 'shougo/vimfiler.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'jelera/vim-javascript-syntax'
Plug 'mhinz/vim-startify'
Plug 'kopischke/vim-stay'
Plug 'keith/swift.vim'
Plug 'cfdrake/vim-carthage'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
call plug#end()
filetype plugin indent on

" Theming
syntax enable
colorscheme PaperColor

set background=light
set guifont=Source\ Code\ Pro\ for\ Powerline:h14

let g:Powerline_symbols = 'fancy'

set number
set nolist
set nowrap
set showmatch
set cursorline
set noshowmode
set scrolloff=30

" file type settings
filetype plugin indent on

set tabstop=4
" set expandtab
" set smarttab

autocmd Filetype html  setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby  setlocal ts=2 sw=2 expandtab
autocmd Filetype swift setlocal ts=4 sw=4 expandtab
autocmd Filetype js    setlocal ts=4 sw=2 expandtab

au BufNewFile,BufRead .* call SetFileTypeSH("bash")
au BufNewFile,BufRead *.swift set filetype=swift

" enable react highlighting for .js extension
let g:jsx_ext_required = 0

" (disabled) enable whitespace indicators
set list
set listchars=tab:▸\ ,trail:·,eol:¬

nmap <leader>l :set list!<CR>

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Jump out of a block of parentheses (uses Delitmate)
imap <C-j> <C-g>g

autocmd VimEnter * silent! autocmd! Explore

" file explorer settings
let g:vimfiler_as_default_explorer = 1

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
\ 'dir':  '\v[\/]\.(git|hg|svn|node_modules)$',
\ 'file': '\v\.(exe|so|dll)$',
\ 'link': 'some_bad_symbolic_links',
\ }

" lightline settings
set laststatus=2
set encoding=utf-8

scriptencoding utf-8

let g:lightline = {
      \ 'colorscheme': 'PaperColor',
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }
