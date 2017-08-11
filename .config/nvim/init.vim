" plugin manager
call plug#begin('~/.config/nvim/plugged')
" file plugins
Plug 'shougo/unite.vim' " used by vimfiler
Plug 'shougo/vimfiler.vim'
Plug 'wincent/command-t', {
    \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
    \ }
" theming plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lilydjwg/colorizer'
Plug 'NLKNguyen/papercolor-theme'
" syntax highlighting
Plug 'sheerun/vim-polyglot'
" autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
" utilities
Plug 'moll/vim-bbye'
Plug 'terryma/vim-multiple-cursors'
Plug 'mhinz/vim-startify'
Plug 'kopischke/vim-stay'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
call plug#end()

" load config files
source $HOME/.config/nvim/theme.vim
source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/bindings.vim

" load plugin config files
source $HOME/.config/nvim/pluginconfig/airline.vim
source $HOME/.config/nvim/pluginconfig/cmdt.vim
source $HOME/.config/nvim/pluginconfig/deocomplete.vim
source $HOME/.config/nvim/pluginconfig/multicursor.vim
source $HOME/.config/nvim/pluginconfig/startify.vim
source $HOME/.config/nvim/pluginconfig/vimfiler.vim
