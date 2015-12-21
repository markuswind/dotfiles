#!/bin/bash

dir=~/dotfiles
cd $dir

files="gitconfig githelpers tmux.conf zshrc"

for file in $files; do
   echo "Creating symlink to $file in home directory"
   ln -s $dir/.$file ~/.$file
done

echo "Creating .config folder"
mkdir -p .config

for conf in "$dir/.config/"*
do
   file="$(basename $conf)"
   ln -s "$dir/.config/$file" ".config/"
done
