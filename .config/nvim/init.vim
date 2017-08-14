if empty($VIM_NO_EXTRA)
    call plug#begin('$HOME/.config/nvim/plugged')
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
        " utilities
        Plug 'w0rp/ale'
        Plug 'moll/vim-bbye'
        Plug 'terryma/vim-multiple-cursors'
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
source $HOME/.config/nvim/bindings.vim

" load plugin config files
let pluginConfigFiles = [
    \ 'ale',
    \ 'ctrlp',
    \ 'deocomplete', 
    \ 'vim-airline',
    \ 'vim-devicons', 
    \ 'vim-multiple-cursors', 
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
source ~/.config/nvim/pluginconfig/ale.vim
source ~/.config/nvim/pluginconfig/ctrlp.vim
source ~/.config/nvim/pluginconfig/deocomplete.vim
source ~/.config/nvim/pluginconfig/vim-airline.vim
source ~/.config/nvim/pluginconfig/vim-devicons.vim
source ~/.config/nvim/pluginconfig/vim-multiple-cursors.vim
source ~/.config/nvim/pluginconfig/vim-startify.vim
source ~/.config/nvim/pluginconfig/vimfiler.vim
