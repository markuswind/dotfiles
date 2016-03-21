#!/bin/bash

dir=~/dotfiles
cd $dir

files="bash_aliases gitconfig githelpers tmux.conf zshrc xvimrc"

for file in $files;
do
   echo "Creating symlink to $file in home directory"
   ln -sf $dir/.$file ~/.$file
done

echo "Creating symlink to .config/nvim folder"
mkdir -p $dir/.config
ln -sf $dir/.config/nvim ~/.config/nvim
