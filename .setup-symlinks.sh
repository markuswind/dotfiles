#!/bin/bash

dir=~/dotfiles
cd $dir

YELLOW = '\033[0;31m'
files="bash_aliases gitconfig githelpers tmux.conf zshrc vimrc gvimrc xvimrc"

for file in $files;
do
   echo "Creating symlink to $file in home directory"
   ln -sf $dir/.$file ~/.$file
done

echo "Creating symlink to .config/nvim folder"
mkdir -p $dir/.config
ln -sf $dir/.config/nvim ~/.config/nvim

echo "Creating symlink to .vim folder"
mkdir -p $dir/.vim
ln -sf $dir/.vim ~/.vim
