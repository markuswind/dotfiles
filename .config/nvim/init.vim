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
        Plug 'lilydjwg/colorizer'
        Plug 'Yggdroot/indentLine'
        Plug 'NLKNguyen/papercolor-theme'
        " syntax highlighting
        Plug 'sheerun/vim-polyglot'
        " utilities
        Plug 'w0rp/ale'
        Plug 'moll/vim-bbye'
        Plug 'mhinz/vim-startify'
        Plug 'kopischke/vim-stay'
        Plug 'tpope/vim-fugitive'
        Plug 'airblade/vim-gitgutter'
        " autocompletion
        if has("python3") == 1
            Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
            Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
        endif
    call plug#end()
endif

" load config files
source $HOME/.config/nvim/theme.vim
source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/commands.vim
source $HOME/.config/nvim/bindings.vim
source $HOME/.config/nvim/statusline.vim

" load plugin config files
let pluginConfigFiles = [
    \ 'ale',
    \ 'command-t',
    \ 'deocomplete', 
    \ 'indentline',
    \ 'vim-startify',
    \ 'vimfiler']

" TODO: - this ain't working yet ..
if !empty($VIM_NO_EXTRA)
    for fileName in pluginConfigFiles
        let basePath = '$HOME/.config/nvim'

        " if !empty(glob(basePath + '/plugged/' + fileName))
            " exec 'source ' + basePath' + /pluginconfig/' + fileName + '.vim'
        " endif
    endfor
endif

" TODO: - temp fix for sourcing pluginconfig
source $HOME/.config/nvim/pluginconfig/ale.vim
source $HOME/.config/nvim/pluginconfig/command-t.vim
source $HOME/.config/nvim/pluginconfig/deocomplete.vim
source $HOME/.config/nvim/pluginconfig/indentline.vim
source $HOME/.config/nvim/pluginconfig/vim-startify.vim
source $HOME/.config/nvim/pluginconfig/vimfiler.vim
