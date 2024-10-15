local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Dracula (Official)'
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.window_decorations = 'RESIZE'
config.window_background_opacity = 0.9
config.macos_window_background_blur = 10
config.font = wezterm.font 'MesloLGS Nerd Font Mono'
config.font_size = 14

return config
