# Tools
winget install "Flow Launcher"
winget install CodeSector.TeraCopy
winget install voidtools.Everything
winget install Zen-Team.Zen-Browser
winget install Microsoft.PowerToys
winget install REALiX.HWiNFO
winget install localsend
winget install Obsidian.Obsidian
winget install RARLab.WinRAR

# Streaming
winget install OBSProject.OBSStudio

# terminal
winget install wez.wezterm
winget install eza-community.eza
winget install ajeetdsouza.zoxide

# Programming
winget install Jetbrains.Toolbox
winget install Axosoft.GitKraken
winget install Microsoft.VisualStudioCode

# Elgato
winget install Elgato.StreamDeck
winget install Elgato.ControlCenter

# Media/Fun
winget install Discord.Discord
winget install Spotify.Spotify
winget install Valve.Steam

winget install LGUG2Z.komorebi

winget install LGUG2Z.wkhd
Copy-Item .\windows-config\komorebi.json ~\
Copy-Item .\windows-config\.config\whkdrc ~\.config
komorebic fetch-asc
komorebic enable-autostart

Write-Output "Install StreamerBot, Universal Control"

