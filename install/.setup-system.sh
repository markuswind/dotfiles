# install & setup brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
sh .setup-brew.sh

# install oh-my-zsh & setup symlinks
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
sh .setup-symlinks.sh

# setup osx settings
echo 'Done! 🙌'
echo '..'
echo 'now you can run other scripts in install/ folder ..'

# sh .setup-osx.sh

