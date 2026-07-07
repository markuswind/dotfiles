#!/bin/bash

dir=~/dotfiles
cd "$dir" || exit

files="bash_aliases eslintrc.json gitconfig githelpers zshrc xvimrc"

for file in $files;
do
   echo "Creating symlink to $file in home directory"
   ln -sf "$dir/.$file" ~/."$file"
done

echo "Creating symlink to .config/nvim folder"
ln -sf "$dir/.config/nvim" ~/.config/nvim

echo "Creating symlink to .config/htop folder"
ln -sf "$dir/.config/htop" ~/.config/htop

echo "Creating symlink to .config/iterm2 folder"
ln -sf "$dir/.config/iterm2" ~/.config/iterm2

echo "Creating symlink to .config/ghostty folder"
ln -sf "$dir/.config/ghostty" ~/.config/ghostty

echo "Creating symlink for wind.zsh-theme"
ln -sf ~/dotfiles/.oh-my-zsh/custom/themes/wind.zsh-theme ~/.oh-my-zsh/custom/themes/wind.zsh-theme

if [ -f ~/dotfiles/.secret_zshrc ]; then
  echo "Creating symlink for secret zshrc"
  ln -sf ~/dotfiles/.secret_zshrc ~/.secret_zshrc
fi

echo "Creating symlinks for cursor skills"
mkdir -p ~/.cursor/skills-cursor
for skill_dir in ~/dotfiles/.agents/skills/*/; do
  skill_name=$(basename "$skill_dir")
  ln -sfn "$skill_dir" ~/.cursor/skills-cursor/"$skill_name"
done

echo "Creating symlink for cursor rules"
ln -sfn "$dir/.cursor/rules" ~/.cursor/rules
