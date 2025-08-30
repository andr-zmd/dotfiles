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

--

config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.7

-- OS Specific Configs
if getOS() == "Windows" then
	-- Window Configs
	config.default_prog = { "powershell.exe" }
	config.window_decorations = "RESIZE"
else
	-- Linux Configs
	config.enable_wayland = false
end

-- Finally, return the configuration to wezterm:
return config
