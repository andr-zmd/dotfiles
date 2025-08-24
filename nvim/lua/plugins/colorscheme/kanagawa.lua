return {
	"rebelot/kanagawa.nvim",
	config = function()
		require("kanagawa").setup({
			overrides = function(colors)
				return {
					StatusLine = { bg = "NONE" },
					StatusLineNC = { bg = "NONE" },

					-- Dashboard
					DashboardHeader = { fg = "#c4b28a" },
					DashboardCenter = { fg = "#c4b28a" },

					-- TabLine
					TabLine = { bg = "none" },
				}
			end,
			theme = "dragon",
			colors = {
				theme = {
					all = {
						ui = {
							bg_gutter = "none",
							float = {
								bg = "#181616",
								bg_border = "#181616",
							},
							pmenu = {
								bg = "#181616",
								bg_thumb = "#54546d",
								bg_sel = "none",
								fg_sel = "#c4b28a",
								bg_sbar = "none",
							},
						},
					},
				},
			},
		})

		vim.cmd("colorscheme kanagawa-dragon")
	end,
	lazy = false,
	priority = 1000,
}
