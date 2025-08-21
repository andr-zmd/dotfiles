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
				}
			end,
			theme = "dragon",
			colors = {
				theme = {
					all = {
						ui = {
							bg_gutter = "none",
							float = {
								bg = "#282727",
								bg_border = "#282727",
							},
							pmenu = {
								bg = "#282727",
								bg_sel = "none",
								fg_sel = "#c4b28a",
								bg_thumb = "#c4b28a",
								bg_sbar = "none",
							},
						},
					},
				},
			},
		})

		-- Custom highlight groups
		vim.api.nvim_set_hl(0, "WindowsNormal", { bg = "#181616" })
		vim.api.nvim_set_hl(0, "WindowsBorder", { bg = "#181616", fg = "#54546D" })
		vim.api.nvim_set_hl(0, "WindowsTitle", { bg = "#181616", fg = "#7a8382" })

		vim.cmd("colorscheme kanagawa-dragon")
	end,
	lazy = false,
	priority = 1000,
}
