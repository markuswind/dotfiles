#!/bin/bash

brew update
brew upgrade

brew install nvm
brew install flow
brew install watchman

brew install --cask react-native-debugger

nvm install iojs
nvm alias default iojs

npm install -g ios-sim
npm install -g react-native-cli

gem install xcpretty
