#!/bin/bash

xcode-select --install

which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update
fi

install () {
    brew list $1 || brew install  $1
}

caskInstall () {
    brew list $1 || brew install --cask $1
}

# OSX Settings

# show all hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder "AppleShowAllFiles" -bool "true" && killall Finder
defaults write com.apple.dock "tilesize" -int "36" && killall Dock
defaults write com.apple.dock "autohide" -bool "true" && killall Dock
defaults write com.apple.dock "show-recents" -bool "false" && killall Dock
defaults write com.apple.dock "static-only" -bool "true" && killall Dock

# Create and Move Projects folder in HOME
mkdir $HOME/Projects
open $HOME

# tools
caskInstall 1password
caskInstall parsec
caskInstall google-chrome

# programming
caskInstall jetbrains-toolbox
install scrcpy
caskInstall visual-studio-code
caskInstall gitkraken
install rbenv ruby-build
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zprofile
echo 'eval "$(rbenv init -)"' >> ~/.zprofile


# other stuff
caskInstall discord
caskInstall signal

# open these
caskInstall hiddenbar
# sudo open -a "Hidden Bar"
caskInstall rectangle
# open -a "rectangle"
caskInstall menubarx
# open -a "menubarx"
caskInstall cheatsheet
# open -a "cheatsheet"hidden
caskInstall alfred
caskInstall duet


echo "


######################
echo REMEMBER TO INSTALL

echo Dropover
echo ---------------
echo https://dropoverapp.com/

"
