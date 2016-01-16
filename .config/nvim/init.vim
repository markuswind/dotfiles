set nocompatible
set nrformats=
set noswapfile
filetype plugin indent on

" Theming
syntax enable
set number
set cursorline
set noshowmode
colorscheme tropikos

" tab size settings
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

" set list
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

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<Tab>"
    else
        return "\<C-n>"
    endif
endfunction

" plugin manager
call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'lambdalisue/vim-django-support',
Plug 'keith/swift.vim', { 'for': 'swift' }
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()

" Plugin configuration
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#show_message = 0
let g:airline_theme = 'bubblegum'
