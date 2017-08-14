" plugin manager
call plug#begin('~/.config/nvim/plugged')
" file plugins
Plug 'ctrlpvim/ctrlp.vim'
Plug 'shougo/unite.vim' " used by vimfiler
Plug 'shougo/vimfiler.vim'
" theming plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lilydjwg/colorizer'
Plug 'ryanoasis/vim-devicons'
Plug 'NLKNguyen/papercolor-theme'
" syntax highlighting
Plug 'sheerun/vim-polyglot'
" autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
" utilities
Plug 'w0rp/ale'
Plug 'moll/vim-bbye'
Plug 'terryma/vim-multiple-cursors'
Plug 'mhinz/vim-startify'
Plug 'kopischke/vim-stay'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
call plug#end()

" load config files
source $HOME/.config/nvim/theme.vim
source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/bindings.vim

" load plugin config files
source $HOME/.config/nvim/pluginconfig/airline.vim
source $HOME/.config/nvim/pluginconfig/ale.vim
source $HOME/.config/nvim/pluginconfig/ctrlp.vim
source $HOME/.config/nvim/pluginconfig/deocomplete.vim
source $HOME/.config/nvim/pluginconfig/devicons.vim
source $HOME/.config/nvim/pluginconfig/multicursor.vim
source $HOME/.config/nvim/pluginconfig/startify.vim
source $HOME/.config/nvim/pluginconfig/vimfiler.vim
