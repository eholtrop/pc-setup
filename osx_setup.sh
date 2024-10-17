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

appendZshrc () {
    grep -qxF $1 ~/.zshrc || echo $1 >> ~/.zshrc
    source ~/.zshrc
}

# OSX Settings
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder "AppleShowAllFiles" -bool "true" && killall Finder
defaults write com.apple.dock "tilesize" -int "36" && killall Dock
defaults write com.apple.dock "autohide" -bool "true" && killall Dock
defaults write com.apple.dock "show-recents" -bool "false" && killall Dock
defaults write com.apple.dock "static-only" -bool "true" && killall Dock

# Create Projects folder in home
mkdir $HOME/Projects

# brew

caskInstall wezterm
rm ~/.wezterm.lua
cp .wezterm.lua ~/

install powerlevel10k
install font-meslo-lg-nerd-font
install zsh-autosuggestions
appendZshrc "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
install zsh-syntax-highlighting
appendZshrc "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# better cd
install zoxide
appendZshrc "alias cd=\"z\""

# better ls
install eza
appendZshrc "alias ls=\"eza --icons=always\""

# fix history
appendZshrc "HISTFILE=$HOME/.zhistory"
appendZshrc "SAVEHIST=1000"
appendZshrc "HISTSIZE=999"
appendZshrc "setopt share_history"
appendZshrc "setopt hist_expire_dups_first"
appendZshrc "setopt hist_ignore_dups"
appendZshrc "setopt hist_verify"
appendZshrc "bindkey '^[[A' history-search-backward"
appendZshrc "bindkey '^[[B' history-search-forward"

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
caskInstall readdle-spark

caskInstall obsidian

caskInstall nikitabobko/tap/aerospace
ln -s aerospace.toml ~/.aerospace.toml

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

# this must be last in zshrc
appendZshrc "eval \"\$(zoxide init zsh)\""
