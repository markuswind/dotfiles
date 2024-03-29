" enter the current millenium
set nocompatible
filetype plugin indent on

" use zsh shell
set shell=/bin/zsh

" fix backspace behaviour
set backspace=indent,eol,start

" search down in to subfolders
set path+=**

" display all matching files when we tab complete
set wildmenu

" indent settings
set tabstop=2
set shiftwidth=2
let &softtabstop = &shiftwidth

set expandtab

set autoindent
set smartindent

autocmd Filetype html  setlocal ts=2 sw=2
autocmd Filetype js    setlocal ts=2 sw=2
autocmd Filetype jsx   setlocal ts=2 sw=2
autocmd Filetype ts    setlocal ts=2 sw=2
autocmd Filetype tsx   setlocal ts=2 sw=2
autocmd Filetype lua   setlocal ts=2 sw=2
autocmd Filetype ruby  setlocal ts=2 sw=2
autocmd Filetype swift setlocal ts=2 sw=2

" fold settings
set foldmethod=syntax
set foldlevelstart=99

" file type settings
au BufNewFile,BufRead .*      set filetype=sh
au BufNewFile,BufRead *.lua   set filetype=lua
au BufNewFile,BufRead *.swift set filetype=swift
au BufNewFile,BufRead *.jsx   set filetype=javascript,jsx
au BufNewFile,BufRead *.ts    set filetype=typescript
au BufNewFile,BufRead *.tsx   set filetype=typescript,tsx
au BufNewFile,BufRead *.json  set fdm=syntax " make folding work for json files

" editor settings
set encoding=utf8
set regexpengine=1
set noeol
set autoread
set ignorecase
set nowrap
set mouse=a
set scrolloff=10
set colorcolumn=80

" coc.nvim settings
set updatetime=300
set signcolumn=yes

" ignore annoying swapfile messages
set shortmess+=A

" enable italic comments (see: .config/iterm2/xterm-256color-itcalic.terminfo)
highlight Comment cterm=italic

" natural splits
set splitbelow
set splitright

" tab settings
set hidden

" open explorer on open
autocmd VimEnter * silent! autocmd! Explore
"
" autoread and autowrite
augroup save
  au!
  au FocusLost * wall
augroup END

" ignore warning about updated files
set autoread
autocmd FocusGained,CursorHold ?* if getcmdwintype() == '' | checktime | endif

" setup tmp files
if exists('$SUDO_USER')
  set nobackup                                " don't create root-owned files
  set nowritebackup                           " don't create root-owned files
else
  set backupdir=~/local/.config/nvim/tmp/backup
  set backupdir+=~/.config/nvim/tmp/backup    " keep backup files out of the way
  set backupdir+=.
endif

if exists('$SUDO_USER')
  set noswapfile                              " don't create root-owned files
else
  set directory=~/local/.config/nvim/tmp/swap//
  set directory+=~/.config/nvim/tmp/swap//    " keep swap files out of the way
  set directory+=.
endif

if has('persistent_undo')
  if exists('$SUDO_USER')
    set noundofile                            " don't create root-owned files
  else
    set undodir=~/local/.config/nvim/tmp/undo
    set undodir+=~/.config/nvim/tmp/undo      " keep undo files out of the way
    set undodir+=.
    set undofile                              " actually use undo files
  endif
endif

if has('viminfo')
  if exists('$SUDO_USER')
    set viminfo=                      " don't create root-owned files
  else
    if isdirectory('~/local/.config/nvim/tmp')
      set viminfo+=n~/local/.config/nvim/tmp/viminfo
    else
      set viminfo+=n~/.config/nvim/tmp/viminfo " override ~/.viminfo default
    endif

    if !empty(glob('~/.config/nvim/tmp/viminfo'))
      if !filereadable(expand('~/.config/nvim/tmp/viminfo'))
        echoerr 'warning: ~/.config/nvim/tmp/viminfo exists but is not readable'
      endif
    endif
  endif
endif

if has('mksession')
  if isdirectory('~/local/.config/nvim/tmp')
    set viewdir=~/local/.config/nvim/tmp/view
  else
    set viewdir=~/.config/nvim/tmp/view       " override ~/.config/nvim/view default
  endif
  set viewoptions=cursor,folds        " save/restore just these (with `:{mk,load}view`)
endif

" setup highlight colors
if !has('nvim')
  " sync with corresponding nvim settings in ~/.config/nvim/plugin/autocmds.vim:
  set highlight+=@:ColorColumn " ~/@ at end of window, 'showbreak'
  set highlight+=N:DiffText    " make current line number stand out a little
  set highlight+=c:LineNr      " blend vertical separators with line numbers
endif

" yank to clipboard
if has("clipboard")
  set clipboard=unnamed

  if has("unnamedplus")
    set clipboard+=unnamedplus
  endif
endif

" python environment
" let g:python_host_prog = 'usr/bin/python2.7'
" let g:python3_host_prog = '/usr/local/bin/python3'
