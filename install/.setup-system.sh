#!/bin/bash

# install & setup brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
sh .setup-brew.sh

# install oh-my-zsh & setup symlinks
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sh .setup-symlinks.sh

# setup osx settings
echo 'Done! 🙌'
echo '..'
echo 'now you can run other scripts in install/ folder ..'

# sh .setup-osx.sh

