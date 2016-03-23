set nocompatible
set ttyfast

set nrformats=
set autoread
set ignorecase

" Set centralize backups, swapfiles and undo history
set clipboard=unnamedplus

set backupdir=~/dotfiles/.config/nvim/backups
set directory=~/dotfiles/.config/nvim/swaps

if exists("&undodir")
  set undodir=~/~dotfiles/.config/nvim/undo
endif

" Theming
syntax enable
colorscheme tropikos

set number
set nowrap
set showmatch
set cursorline
set noshowmode
set scrolloff=30

" filetype settings
filetype plugin indent on

set tabstop=4
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
call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'lambdalisue/vim-django-support',
Plug 'keith/swift.vim',
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()

" Plugin configuration
let g:netrw_list_hide= '.*\.pyc,\.DS_Store'
let g:airline_theme = 'bubblegum'
let g:airline_powerline_fonts = 1

" Disable airline whitespace indicator
autocmd VimEnter * AirlineToggleWhitespace

" Functions
function! InsertTabWrapper()
    let col = col('.') - 1

    if !col || getline('.')[col - 1] !~ '\k'
        return "\<Tab>"
    else
        return "\<C-n>"
    endif
endfunction
