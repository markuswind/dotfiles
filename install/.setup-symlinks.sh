#!/bin/bash

dir=~/dotfiles
cd $dir

files="bash_aliases gitconfig githelpers zshrc vimrc"

for file in $files;
do
   echo "Creating symlink to $file in home directory"
   ln -sf $dir/.$file ~/.$file
done

echo "Creating symlink to .config/nvim folder"
ln -sf $dir/.config/nvim ~/.config/nvim

echo "Creating symlink to .config/htop folder"
ln -sf $dir/.config/htop ~/.config/htop

echo "Creating symlink for wind.zsh-theme"
ln -sf ~/dotfiles/.oh-my-zsh/custom/themes/wind.zsh-theme ~/.oh-my-zsh/custom/themes/wind.zsh-theme
