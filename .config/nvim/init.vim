if empty($VIM_NO_EXTRA)
    call plug#begin('$HOME/.config/nvim/plugged')
        " file plugins
        Plug 'shougo/unite.vim' " used by vimfiler
        Plug 'shougo/vimproc.vim', { 'do': 'make' } " used by vimfiler
        Plug 'shougo/vimfiler.vim'
        Plug 'wincent/command-t', {
            \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
            \ } 
        " theming plugins
        Plug 'chriskempson/base16-vim'
        Plug 'lilydjwg/colorizer'
        Plug 'Yggdroot/indentLine'
        Plug 'wincent/pinnacle'
        " syntax highlighting
        Plug 'sheerun/vim-polyglot'
        Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
        " utilities
        Plug 'moll/vim-bbye'
        Plug 'tpope/vim-commentary'
        Plug 'rhysd/devdocs.vim'
        Plug 'editorconfig/editorconfig-vim'
        Plug 'tpope/vim-fugitive'
        Plug 'airblade/vim-gitgutter'
        Plug 'mhinz/vim-grepper'
        Plug 'kopischke/vim-stay'
        " Conquere of Completion
        Plug 'neoclide/coc.nvim', { 'tag': '*', 'do': { -> coc#util#install() } }
    call plug#end()
endif

" load config files
source $HOME/.config/nvim/theme.vim
source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/commands.vim
source $HOME/.config/nvim/bindings.vim
