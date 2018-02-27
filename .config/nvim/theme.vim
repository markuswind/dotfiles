syntax enable
colorscheme base16-default-dark

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

set guifont=Sauce\ Code\ Pro\ for\ Powerline:h11
set guioptions=aem

" transparancy ..
highlight Normal  ctermbg=none
highlight NonText ctermbg=none

set cursorline
" set noshowmode

" enable whitespace indicators
set list
set listchars=tab:▸\ ,trail:·,eol:¬

" show line numbers
set number
set relativenumber
set numberwidth=6

" hide line numbers in terminal buffer
au TermOpen * setlocal nonumber norelativenumber

" vertical split borders
set fillchars+=vert:│ 
