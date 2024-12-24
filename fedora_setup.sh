#!/bin/zsh

install () {
    sudo dnf install -y $1
}

flatInstall () {
    flatpak install -y flathub $1
}

install zsh
chsh -s $(which zsh)

install ulauncher
install wmctrl

install zsh-autosuggestions

install zsh-syntax-highlighting

# better cd
install zoxide

# better ls
install eza

sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
sudo sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=\"https://downloads.1password.com/linux/keys/1password.asc\"" > /etc/yum.repos.d/1password.repo'
install 1password

flatInstall io.github.zen_browser.zen
flatInstall com.axosoft.GitKraken
flatInstall com.discordapp.Discord
flatInstall com.spotify.client
flatInstall md.obsidian.Obsidian
flatInstall dev.zed.Zed

flatInstall org.wezfurlong.wezterm
rm ~/.wezterm.lua
cp .wezterm.lua ~/

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
# install font-meslo-lg-nerd-font

# fix history
rm ~/.zshrc
cp fedora-config/.zshrc ~/

source ~/.zshrc
