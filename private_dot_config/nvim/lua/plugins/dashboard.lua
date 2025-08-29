local neovimHeader1 = {
	[[      ___           ___           ___           ___                       ___      ]],
	[[     /\__\         /\  \         /\  \         /\__\          ___        /\__\     ]],
	[[    /  |  |       /  \  \       /  \  \       / /  /         /\  \      /  |  |    ]],
	[[   / | |  |      / /\ \  \     / /\ \  \     / /  /          \ \  \    / | |  |    ]],
	[[  / /| |  |__   /  \-\ \  \   / /  \ \  \   / /__/  ___      /  \__\  / /| |__|__  ]],
	[[ / / | | /\__\ / /\ \ \ \__\ / /__/ \ \__\  | |  | /\__\  __/ /\/__/ / / |    \__\ ]],
	[[ \/__| |/ /  / \ \-\ \ \/__/ \ \  \ / /  /  | |  |/ /  / /\/ /  /    \/__/--/ /  / ]],
	[[     | / /  /   \ \ \ \__\    \ \  / /  /   | |__/ /  /  \  /__/           / /  /  ]],
	[[     |  /  /     \ \ \/__/     \ \/ /  /     \    /  /    \ \__\          / /  /   ]],
	[[     | /  /       \ \__\        \  /  /       \__/__/      \/__/         / /  /    ]],
	[[     \/__/         \/__/         \/__/                                   \/__/     ]],
	[[                                                                                   ]],
}

return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			-- config
			theme = "doom",
			hide = {
				"statusline",
			},
			config = {
				header = neovimHeader1,
				center = {
					{
						icon = "    ",
						icon_hl = "DashboardCenter",
						desc = "Restore Session",
						desc_hl = "DashboardCenter",
						key = "r",
						key_hl = "DashboardCenter",
						key_format = " [%s]", -- `%s` will be substituted with value of `key`
						action = function()
							vim.cmd("AutoSession restore")
						end,
					},
					{
						icon = "󰒓    ",
						icon_hl = "DashboardCenter",
						desc = "Configuration",
						desc_hl = "DashboardCenter",
						key = "c",
						key_hl = "DashboardCenter",
						key_format = " [%s]", -- `%s` will be substituted with value of `key`
						action = function()
							require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
						end,
					},
				},
				footer = {},
				vertical_center = true,
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
