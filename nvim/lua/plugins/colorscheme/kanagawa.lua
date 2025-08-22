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

					-- Float
					FloatTitle = { bg = "none" },

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
								bg_sel = "#c4b28a",
								fg_sel = "#181616",
								bg_thumb = "#c4b28a",
								bg_sbar = "#181616",
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
