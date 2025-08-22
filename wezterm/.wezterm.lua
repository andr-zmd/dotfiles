-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Terminal
config.default_prog = { "powershell.exe" }

config.initial_cols = 120
config.initial_rows = 28

-- Font
config.font_size = 12
config.font = wezterm.font("JetBrains Mono")

-- Themes and Colors
local bg_color_solid = "rgb(24, 22, 22)"
local bg_color_tl = "rgba(24, 22, 22, 0.90)"

local active_text_color = "#c4b28a"
local text_color = "#808080"

config.color_scheme = "Kanagawa Dragon (Gogh)"

config.colors = {
	tab_bar = {
		background = "rgba(24, 22, 22, 0.90)",
		new_tab = {
			bg_color = bg_color_tl,
			fg_color = text_color,
		},
	},
}

-- Windows
config.window_decorations = "RESIZE|INTEGRATED_BUTTONS" -- RESIZE|INTEGRATED_BUTTONS
config.window_background_opacity = 0.9
config.window_padding = {
	top = 15,
}

-- Tabs
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_max_width = 32

local function tab_title(tab_info)
	local title = tab_info.tab_title
	if title and #title > 0 then
		return title
	end
	return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = tab_title(tab)
	if tab.is_active then
		return {
			{ Background = { Color = bg_color_solid } },
			{ Foreground = { Color = active_text_color } },
			{ Text = "  " .. title .. "  " },
		}
	end

	return {
		{ Background = { Color = bg_color_tl } },

		{ Text = "  " .. title .. "  " },
	}
end)

-- Finally, return the configuration to wezterm:
return config
