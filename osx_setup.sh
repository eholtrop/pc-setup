#!/bin/zsh

xcode-select --install

if [[ $(command -v brew) == "" ]]; then
    echo "Installing Hombrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    export PATH="/opt/homebrew/bin:$PATH" >> ~/.zshrc
    brew update
else
    echo "Updating Homebrew"
    brew update
fi

install () {
    brew list $1 || brew install $1
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

caskInstall alfred
git clone https://github.com/dracula/alfred
open /alfred/Dracula.alfredappearance
rm -rf alfred

caskInstall firefox
caskInstall duet
caskInstall soundsource
caskInstall contexts
open /Applications/Contexts.app
caskInstall bettertouchtool
open /Applications/BetterTouchTool.app
caskInstall karabiner-elements
caskInstall elgato-stream-deck
caskInstall spotify
open /Applications/Spotify.app
caskInstall discord
open /Applications/Discord.app
caskInstall obs
caskInstall zen-browser
caskInstall wezterm
caskInstall readdle-spark
caskInstall obsidian

# airdrop alternative
brew tap localsend/localsend
install localsend

# programming
caskInstall jetbrains-toolbox
install scrcpy
caskInstall visual-studio-code
caskInstall zed
git clone https://github.com/dracula/zed.git
cp zed/themes/dracula.json ~/.config/zed/themes
rm -rf zed
caskInstall gitkraken


# other stuff
caskInstall discord
caskInstall beeper
caskInstall bambu-studio
caskInstall google-drive

# open these
caskInstall rectangle
open -a "rectangle"
caskInstall cheatsheet

curl -s "https://get.sdkman.io" | bash

echo "


######################
echo REMEMBER TO INSTALL

echo Dropover
echo ---------------
echo https://dropoverapp.com/
"

source "/Users/evanholtrop/.sdkman/bin/sdkman-init.sh"
