return {
	"dgox16/oldworld.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("oldworld").setup({
			highlight_overrides = {
				-- Telescope
				TelescopeBorder = { link = "FloatBorder" },
				TelescopeTitle = { fg = "#c9c7cd" },
				TelescopeResultsTitle = { fg = "#c9c7cd" },
				TelescopePreviewTitle = { fg = "#c9c7cd" },
				-- Blink
				BlinkCmpKind = { fg = "#c9c7cd" },
				BlinkCmpMenuBorder = { fg = "#313134" },
				BlinkCmpLabelDetail = { fg = "#c9c7cd" },
				BlinkCmpLabelDescription = { fg = "#c9c7cd" },
				-- WhichKey
				WhichKeyNormal = { bg = "#161617" },
				-- Dap Controls
				WinBar = { bg = "#161617" },
				WinBarNC = { bg = "#161617" },
				-- Noice
				NoiceCmdlinePopupBorder = { fg = "#c9c7cd", bg = "#161617" },
				NoiceCmdlinePopup = { bg = "#161617" },
			},
		})
		vim.cmd("colorscheme oldworld")
	end,
}
