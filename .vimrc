set nocompatible
set ttyfast

set nrformats=
set autoread
set ignorecase

" Set centralize backups, swapfiles and undo history
set clipboard=unnamedplus

set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set shortmess+=A

if exists("&undodir")
  set undodir=~/~dotfiles/.config/nvim/undo
endif

" Theming
syntax enable
colorscheme tropikos
set background=dark

set number
set nowrap
set showmatch
set cursorline
set noshowmode
set scrolloff=30

" filetype settings
filetype plugin indent on

set tabstop=4
set expandtab
set smarttab

autocmd Filetype html  setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby  setlocal ts=2 sw=2 expandtab
autocmd Filetype swift setlocal ts=4 sw=4 expandtab

au BufNewFile,BufRead .bash_aliases call SetFileTypeSH("bash")

" enable whitespace indicators
set list
set listchars=tab:▸\ ,eol:¬

nmap <leader>l :set list!<CR>

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Tab for autocompletion
inoremap  <expr> <Tab> InsertTabWrapper()
inoremap  <silent> <S-Tab> <C-p>

" plugin manager
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'keith/swift.vim'
Plugin 'cfdrake/vim-carthage'
Plugin 'lambdalisue/vim-django-support'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
call vundle#end()
filetype plugin indent on

" Set wildignores for macvim's file explorer
set wildignore+=.DS_Store,.git

" Functions
function! InsertTabWrapper()
    let col = col('.') - 1

    if !col || getline('.')[col - 1] !~ '\k'
        return "\<Tab>"
    else
        return "\<C-n>"
    endif
endfunction
