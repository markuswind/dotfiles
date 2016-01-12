set nocompatible
set nrformats=
filetype plugin indent on

" Theming
syntax enable
set number
colorscheme tropikos

" set list + shortcut
set list
set listchars=tab:▸\ ,eol:¬

nmap <leader>l :set list!<CR>

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Vundle plugin manager
call plug#begin()

Plug 'VundleVim/Vundle.vim',
Plug 'lambdalisue/vim-django-support',
Plug 'tmux-plugins/vim-tmux-focus-events',
Plug 'keith/swift.vim', { 'for': 'swift' }

call plug#end()
