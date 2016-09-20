brew cask install atom

apm install atom-react-native-autocomplete
apm install autocomplete-paths
apm install base16-ocean-dark-syntax-theme
apm install git-blame
apm install highlight-line
apm install highlight-selected
apm install language-babel
apm install language-javascript-jsx
apm install linter
apm install linter-eslint
apm install nuclide
apm install pigments
apm install pinned-tabs
apm install prime-file-icons
apm install set-syntax
apm install vim-mode

rm -rf ~/.atom
ln -sf ~/dotfiles/.atom ~/
