

sudo dnf install -y ulauncher
sudo dnf install -y wmctrl

sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
sudo sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=\"https://downloads.1password.com/linux/keys/1password.asc\"" > /etc/yum.repos.d/1password.repo'
sudo dnf install -y 1password

flatpak install -y flathub com.visualstudio.code
flatpak install -y flathub io.github.zen_browser.zen
flatpak install -y flathub com.axosoft.GitKraken
flatpak install -y flathub com.discordapp.Discord
flatpak install -y flathub com.spotify.client
flatpak install -y flathub md.obsidian.Obsidian

firefox https://www.jetbrains.com/toolbox-app