#!/bin/bash

dir=~/dotfiles
cd $dir

files="bash_aliases gitconfig githelpers zshrc vimrc xvimrc"

for file in $files;
do
   echo "Creating symlink to $file in home directory"
   ln -sf $dir/.$file ~/.$file
done

echo "Creating symlink to .vim folder"
ln -sf $dir/.vim ~/.vim
