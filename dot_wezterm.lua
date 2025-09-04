local theme = require("themes/kanagawa-dragon")
-- Pull in the wezterm API
local wezterm = require("wezterm")

local function getOS()
	local pathSeparator = package.config:sub(1, 1)
	if pathSeparator == "\\" then
		return "Windows"
	else
		return "Unix"
	end
end

-- This will hold the configuration.
local config = wezterm.config_builder()

config.window_background_opacity = theme.opacity

config.use_fancy_tab_bar = false

config.window_decorations = "RESIZE | INTEGRATED_BUTTONS"

config.colors = {
	tab_bar = {
		background = theme.bg_color,
		active_tab = {
			bg_color = theme.bg_color,
			fg_color = theme.fg_color,
		},
		inactive_tab = {
			bg_color = theme.bg_color,
			fg_color = theme.fg_color_dim,
		},
		new_tab = {
			bg_color = theme.bg_color,
			fg_color = theme.fg_color_dim,
		},
	},
}

-- OS Specific Configs
if getOS() == "Windows" then
	-- Window Configs
	config.default_prog = { "powershell.exe" }
else
	-- Linux Configs
end

-- Finally, return the configuration to wezterm:
return config
