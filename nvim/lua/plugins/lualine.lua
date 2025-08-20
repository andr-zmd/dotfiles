local kdragon_colors = {
	dragonBlack0 = "#0d0c0c",
	dragonBlack1 = "#12120f",
	dragonBlack2 = "#1D1C19",
	dragonBlack3 = "#181616",
	dragonBlack4 = "#282727",
	dragonBlack5 = "#393836",
	dragonBlack6 = "#625e5a",

	dragonWhite = "#c5c9c5",
	dragonGreen = "#87a987",
	dragonGreen2 = "#8a9a7b",
	dragonPink = "#a292a3",
	dragonOrange = "#b6927b",
	dragonOrange2 = "#b98d7b",
	dragonGray = "#a6a69c",
	dragonGray2 = "#9e9b93",
	dragonGray3 = "#7a8382",
	dragonBlue2 = "#8ba4b0",
	dragonViolet = "#8992a7",
	dragonRed = "#c4746e",
	dragonAqua = "#8ea4a2",
	dragonAsh = "#737c73",
	dragonTeal = "#949fb5",
	dragonYellow = "#c4b28a", --"#a99c8b",
	-- "#8a9aa3",
	transparent = "NONE",
}

local kanagawa_dragon = {
	normal = {
		a = { bg = kdragon_colors.dragonTeal, fg = kdragon_colors.dragonBlack0 },
		b = { bg = kdragon_colors.dragonBlack4, fg = kdragon_colors.dragonYellow },
		c = { bg = kdragon_colors.transparent, fg = kdragon_colors.dragonYellow },
	},
	insert = {
		a = { bg = kdragon_colors.dragonGreen, fg = kdragon_colors.dragonBlack0 },
	},
	visual = {
		a = { bg = kdragon_colors.dragonYellow, fg = kdragon_colors.dragonBlack0 },
	},
	replace = {
		a = { bg = kdragon_colors.dragonRed, fg = kdragon_colors.dragonBlack0 },
	},
	command = {
		a = { bg = kdragon_colors.dragonOrange, fg = kdragon_colors.dragonBlack0 },
	},
	inactive = {
		a = { bg = kdragon_colors.transparent },
		b = { bg = kdragon_colors.transparent },
		c = { bg = kdragon_colors.transparent },
	},
}

return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {
			theme = kanagawa_dragon,
			component_separators = "|",
			section_separators = { left = "", right = "" }, -- Curved "scales"

			disabled_filetypes = { "dashboard" },
		},
		sections = {
			lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
			lualine_b = { "filename", "branch" },
			lualine_c = { "%=", "diagnostics" }, -- Dragon's breath (errors/warnings)
			lualine_x = { "diff" }, -- Claw marks (git changes)
			lualine_y = { "filetype" },
			lualine_z = {
				{ "location", separator = { right = "" }, left_padding = 2 }, -- Tail tip
			},
		},
		inactive_sections = {
			lualine_a = { "filename" },
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = { "location" },
		},
		tabline = {},
		extensions = { "neo-tree" },
	},
}
