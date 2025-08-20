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
				header = {
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
				},
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
							vim.cmd(":SessionRestore")
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
							require("telescope.builtin").find_files({ cwd = "C:\\Users\\Andre\\dotfiles\\nvim" })
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
