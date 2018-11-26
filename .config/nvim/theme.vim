syntax enable
set termguicolors
let ayucolor="light" 
colorscheme ayu

set guifont=Sauce\ Code\ Pro\ for\ Powerline:h11
set guioptions=aem

" transparancy ..
highlight Normal  ctermbg=none
highlight NonText ctermbg=none

set cursorline
set cmdheight=2

" enable whitespace indicators
set list
set listchars=tab:▸\ ,trail:·,eol:¬

" show line numbers
set number
set relativenumber
set numberwidth=6

" term specific settings
au TermOpen * setlocal nonumber norelativenumber scrolloff=0

" vertical split borders
set fillchars+=vert:│ 
