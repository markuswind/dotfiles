if empty($VIM_NO_EXTRA)
    call plug#begin('$HOME/.config/nvim/plugged')
        " file plugins
        Plug 'shougo/unite.vim' " used by vimfiler
        Plug 'shougo/vimproc.vim', { 'do': 'make' } " used by vimfiler
        Plug 'shougo/vimfiler.vim'
        Plug 'wincent/command-t', {
            \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
            \ } 
        " language plugins
        Plug 'rust-lang/rust.vim'
        " theming plugins
        Plug 'chriskempson/base16-vim'
        Plug 'lilydjwg/colorizer'
        Plug 'Yggdroot/indentLine'
        Plug 'wincent/pinnacle'
        " syntax highlighting
        Plug 'sheerun/vim-polyglot'
        " utilities
        Plug 'editorconfig/editorconfig-vim'
        Plug 'w0rp/ale'
        Plug 'moll/vim-bbye'
        Plug 'mhinz/vim-startify'
        Plug 'kopischke/vim-stay'
        Plug 'tpope/vim-fugitive'
        Plug 'airblade/vim-gitgutter'
        " autocompletion
        if has("python3") == 1
            Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
            Plug 'mhartington/nvim-typescript'
            Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
        endif
    call plug#end()
endif

" load config files
source $HOME/.config/nvim/theme.vim
source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/commands.vim
source $HOME/.config/nvim/bindings.vim
