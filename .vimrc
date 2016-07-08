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
colorscheme base16-ocean
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

au BufNewFile,BufRead .* call SetFileTypeSH("bash")
au BufNewFile,BufRead *.swift set filetype=swift

" enable react highlighting for .js extension
let g:jsx_ext_required = 0

" enable whitespace indicators
set list
set listchars=tab:▸\ ,eol:¬

nmap <leader>l :set list!<CR>

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" plugin manager
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'moll/vim-bbye'
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
call vundle#end()
filetype plugin indent on

" startify settings
let g:startify_bookmarks = [ { 's': '~/Sites/' },
                           \ { 'xc': '~/XcodeProjects/' },
                           \ { '  ': '' },
                           \ { 'vi': '~/.vimrc' },
                           \ { 'vc': '~/.config/vim/colors/base16-ocean.vim' },
                           \ { '  ': '' },
                           \ { 'pd': '~/dotfiles/' } ]

let g:startify_change_to_dir      = 0
let g:startify_change_to_vcs_root = 1
let g:startify_files_number       = 20

let g:startify_list_order = [ [ '  Sessions' ],
                            \ 'sessions',
                            \ [ '  Bookmarks' ],
                            \ 'bookmarks',
                            \ [ '  MRU' ],
                            \ 'dir' ]

hi StartifyBracket ctermfg=0 cterm=bold
hi StartifyHeader  ctermfg=195

autocmd VimEnter          * silent! autocmd! FileExplorer
autocmd VimEnter,BufEnter * call OpenStartifyInDirectory(expand('<amatch>'))

" file explorer settings
let g:vimfiler_as_default_explorer = 1

" vim-stay settings
set viewoptions=cursor,folds,slash,unix

" Set wildignores for macvim's file explorer
set wildignore+=.DS_Store,.git
set wildignore+=Carthage/*

" Run Startify when opening a directory
function! OpenStartifyInDirectory(dir)
    if a:dir != '' && isdirectory(a:dir)
        cd `=a:dir`

        let g:startify_list_order = [ [ '  MRU ' . getcwd() ],
                                    \ 'dir',
                                    \ [ '  Bookmarks' ],
                                    \ 'bookmarks',
                                    \ [ '  Sessions' ],
                                    \ 'sessions' ]

        if isdirectory('.git')
            let g:startify_custom_header = map(split(system('git status -b'), '\n'), '"  ". v:val')
                                       \ + [ '' ]
                                       \ + [ '' ]
        else
            let g:startify_custom_header = g:startify_default_custom_header
        endif

        Bdelete
        Startify
    endif
endfunction
