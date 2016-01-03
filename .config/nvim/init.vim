set nocompatible
set nrformats=
filetype plugin indent on

" Theming
syntax enable
set number
colorscheme tropikos

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Vundle plugin manager
set rtp+=~/.nvim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'lambdalisue/vim-django-support'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'https://github.com/keith/swift.vim'

call vundle#end()
