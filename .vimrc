
set nrformats=
set autoread
set ignorecase

" Set centralize backups, swap files and undo history
set clipboard=unnamedplus

set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set shortmess+=A

if exists("&undodir")
  set undodir=~/~dotfiles/.config/nvim/undo
endif

" Theming
syntax enable
colorscheme base16-ocean
let base16colorspace=256
set background=dark

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
set expandtab
set smarttab

autocmd Filetype html  setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby  setlocal ts=2 sw=2 expandtab
autocmd Filetype swift setlocal ts=4 sw=4 expandtab
autocmd Filetype js    setlocal ts=2 sw=2 expandtab

au BufNewFile,BufRead .* call SetFileTypeSH("bash")
au BufNewFile,BufRead *.swift set filetype=swift

" enable react highlighting for .js extension
let g:jsx_ext_required = 0

" enable whitespace indicators
set list
" set listchars=tab:▸\ ,eol:¬

nmap <leader>l :set list!<CR>

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Jump out of a block of parentheses (uses Delitmate)
imap <C-j> <C-g>g

" plugin manager
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'moll/vim-bbye'
Plugin 'chriskempson/base16-vim'
Plugin 'Raimondi/delimitMate'
Plugin 'Shougo/unite.vim'
Plugin 'shougo/vimfiler.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mhinz/vim-startify'
Plugin 'kopischke/vim-stay'
Plugin 'keith/swift.vim'
Plugin 'cfdrake/vim-carthage'
Plugin 'lambdalisue/vim-django-support'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'vasconcelloslf/vim-interestingwords'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

Bundle "marijnh/tern_for_vim"
call vundle#end()
filetype plugin indent on

autocmd VimEnter          * silent! autocmd! Explore

" file explorer settings
let g:vimfiler_as_default_explorer = 1

" vim-stay settings
set viewoptions=cursor,folds,slash,unix

" Set wildignores for macvim's file explorer
set wildignore+=.DS_Store,.git
set wildignore+=Carthage/*,node_modules/*

let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/]\.(git|hg|svn|node_modules)$',
\ 'file': '\v\.(exe|so|dll)$',
\ 'link': 'some_bad_symbolic_links',
\ }
