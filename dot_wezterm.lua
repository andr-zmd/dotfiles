-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Terminal
config.enable_wayland = false
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.7

-- Finally, return the configuration to wezterm:
return config
