#!/bin/bash

dir=~/dotfiles
cd $dir || exit

files="bash_aliases gitconfig githelpers zshrc vimrc"

for file in $files;
do
   echo "Creating symlink to $file in home directory"
   ln -sf $dir/."$file" ~/."$file"
done

echo "Creating symlink to .config/nvim folder"
ln -sf $dir/.config/nvim ~/.config/nvim

echo "Creating symlink to .config/htop folder"
ln -sf $dir/.config/htop ~/.config/htop

echo "Creating symlink to .config/iterm2 folder"
ln -sf $dir/.config/iterm2 ~/.config/iterm2

echo "Creating symlink for wind.zsh-theme"
ln -sf ~/dotfiles/.oh-my-zsh/custom/themes/wind.zsh-theme ~/.oh-my-zsh/custom/themes/wind.zsh-theme
