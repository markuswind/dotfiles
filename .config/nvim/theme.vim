syntax enable
set termguicolors

" set ayu color according to iterm profile
let iterm_profile = $ITERM_PROFILE
if iterm_profile == "AyuDark"
  let ayucolor="mirage"
else
  let ayucolor="light"
endif

colorscheme ayu

" misc..
set guifont=Sauce\ Code\ Pro\ for\ Powerline:h11
set guioptions=aem

set cursorline
set cmdheight=2

" transparancy ..
highlight Normal  ctermbg=none
highlight NonText ctermbg=none

" enable whitespace indicators
" set list
set listchars=tab:▸\ ,trail:·,eol:¬

" show line numbers
set number
set relativenumber
set numberwidth=6

" term specific settings
au TermOpen * setlocal nonumber norelativenumber scrolloff=0

" vertical split borders
set fillchars+=vert:│ 
