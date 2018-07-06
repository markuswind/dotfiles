#!/bin/bash

dir=~/dotfiles
cd $dir || exit

files="bash_aliases eslintrc.json gitconfig githelpers hyper.js zshrc vimrc vimrc_background xvimrc"

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

echo "Creating symlink to .config/base16-shell"
ln -sf $dir/.config/base16-shell ~/.config/base16-shell

echo "Creating symlink for wind.zsh-theme"
ln -sf ~/dotfiles/.oh-my-zsh/custom/themes/wind.zsh-theme ~/.oh-my-zsh/custom/themes/wind.zsh-theme

if [ -f ~/dotfiles/.secret_bash_aliases ]; then
  echo "Creating symlink for secret bash aliases"
  ln -sf ~/dotfiles/.secret_bash_aliases ~/.secret_bash_aliases
fi
