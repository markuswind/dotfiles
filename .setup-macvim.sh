# download macvim with file explorer
git clone git://github.com/alloy/macvim.git
cd macvim/src

# configure & build
./configure --with-features=huge \
              --enable-rubyinterp \
              --enable-pythoninterp \
              --enable-perlinterp \
              --enable-luainterp \
              --enable-cscope

make

# install finsihed, move to applications
cp -r MacVim/Build/Release/* /Applications/

# done, remove downloaded folder
cd ../../
rm -rf macvim

# TODO: copy new toolbar images
