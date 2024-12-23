#!/bin/zsh

appendZshrc () {
    grep -qxF $1 ~/.zshrc || echo $1 >> ~/.zshrc
    source ~/.zshrc
}

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
appendZshrc "\"echo \"source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh\" >> \${ZDOTDIR:-$HOME}/.zshrc\"

install zsh-syntax-highlighting
appendZshrc "\"echo \"source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh\" >> \${ZDOTDIR:-$HOME}/.zshrc\"


# better cd
install zoxide
appendZshrc "alias cd=\"z\""

# better ls
install eza
appendZshrc "alias ls=\"eza --icons=always\""

sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
sudo sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=\"https://downloads.1password.com/linux/keys/1password.asc\"" > /etc/yum.repos.d/1password.repo'
install 1password

flatInstall io.github.zen_browser.zen
flatInstall com.axosoft.GitKraken
flatInstall com.discordapp.Discord
flatInstall com.spotify.client
flatInstall md.obsidian.Obsidian
flatInstall dev.zed.Zed
appendZshrc "alias zed=\"flatpak run dev.zed.Zed\""

flatInstall org.wezfurlong.wezterm
rm ~/.wezterm.lua
cp .wezterm.lua ~/

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
appendZshrc "'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc"
# install font-meslo-lg-nerd-font

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

# this must be last in zshrc
appendZshrc "eval \"\$(zoxide init zsh)\""
