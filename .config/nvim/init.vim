set nocompatible
filetype off

syntax enable
set number
colorscheme tropikos

" Vundle plugin manager
set rtp+=~/.nvim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'lambdalisue/vim-django-support'

call vundle#end()
filetype plugin indent on
