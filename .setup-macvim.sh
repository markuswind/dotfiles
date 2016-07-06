git clone git://github.com/alloy/macvim.git
cd macvim/src

./configure --with-features=huge \
              --enable-rubyinterp \
              --enable-pythoninterp \
              --enable-perlinterp \
              --enable-luainterp \
              --enable-cscope \
              --with-luajit \
              --with-lua-prefix=/usr/local/bin/lua

make

echo "Copying application files.."
cp -r MacVim/Build/Release/* /Applications/

echo "Cleaning downloaded files..."
cd ../../
rm -rf macvim

echo "Copying toolbar icons.."
cp -r ~/dotfiles/assets/macvim-icons/* /Applications/MacVim.app/Contents/Resources

echo "MacVim installation finished!"
