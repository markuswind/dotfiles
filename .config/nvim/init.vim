set nocompatible
filetype off

" Theming
syntax enable
set number
colorscheme tropikos

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Python tab setting
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

" Vundle plugin manager
set rtp+=~/.nvim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'lambdalisue/vim-django-support'

call vundle#end()
filetype plugin indent on
