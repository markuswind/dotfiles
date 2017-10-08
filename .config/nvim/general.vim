" enter the current millenium
set nocompatible
filetype plugin indent on

" fix backspace behaviour
set backspace=indent,eol,start

" search down in to subfolders
set path+=**

" display all matching files when we tab complete
set wildmenu

" indent settings
set tabstop=2
set shiftwidth=4
let &softtabstop = &shiftwidth

set expandtab

set autoindent
set smartindent

autocmd Filetype html  setlocal ts=2 sw=2
autocmd Filetype js    setlocal ts=2 sw=4
autocmd Filetype lua   setlocal ts=2 sw=2
autocmd Filetype ruby  setlocal ts=2 sw=2
autocmd Filetype swift setlocal ts=2 sw=4

" file type settings
au BufNewFile,BufRead .* call SetFileTypeSH("bash")
au BufNewFile,BufRead *.lua set filetype=lua
au BufNewFile,BufRead *.swift set filetype=swift

" editor settings
set encoding=utf8
set regexpengine=1
set noeol
set autoread
set ignorecase
set nowrap
set mouse=a
set scrolloff=30
set colorcolumn=80

" enable italic comments (see: .config/iterm2/xterm-256color-itcalic.terminfo)
highlight Comment cterm=italic

" natural splits
set splitbelow
set splitright

" tab settings
set hidden

" open explorer on open
autocmd VimEnter * silent! autocmd! Explore

" disable swaps + backups
set noswapfile
set nowritebackup
set nobackup

if exists("&undodir")
  call system('mkdir -p ~/dotfiles/.config/nvim/undo')
  set undodir=~/dotfiles/.config/nvim/undo
endif

" yank to clipboard
if has("clipboard")
  set clipboard=unnamed

  if has("unnamedplus")
    set clipboard+=unnamedplus
  endif
endif
