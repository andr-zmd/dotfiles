return {
	"xiyaowong/transparent.nvim",
	lazy = false,
	config = function()
		require("transparent").setup({
			groups = {
				"Normal",
				"NormalNC",
				"Comment",
				"Constant",
				"Special",
				"Identifier",
				"Statement",
				"PreProc",
				"Type",
				"Underlined",
				"Todo",
				"String",
				"Function",
				"Conditional",
				"Repeat",
				"Operator",
				"Structure",
				"LineNr",
				"NonText",
				"SignColumn",
				"CursorLine",
				"CursorLineNr",
				"StatusLine",
				"StatusLineNC",
				"EndOfBuffer",
			},
			-- table: additional groups that should be cleared
			extra_groups = {
				-- Float
				"NormalFloat",
				"FloatBorder",
				"FloatTitle",

				-- PopOutMenu
				"Pmenu",
				"PmenuBorder",
			},
			-- table: groups you don't want to clear
			exclude_groups = {},
			-- function: code to be executed after highlight groups are cleared
			-- Also the user event "TransparentClear" will be triggered
			on_clear = function() end,
		})

		vim.keymap.set("n", "<leader>pt", function()
			vim.cmd(":TransparentToggle")
			-- Fix Transparency for Kanagawa-dragon
			if vim.g.colors_name == "kanagawa" then
				vim.cmd(":colorscheme kanagawa-dragon")

				vim.api.nvim_set_hl(0, "TelescopeNormal", { link = "NormalFloat" })
				vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "FloatBorder" })

				vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { link = "FloatBorder" })

				vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { link = "FloatBorder" })
				vim.api.nvim_set_hl(0, "NotifyINFOBorder", { link = "FloatBorder" })
			end
		end, { desc = "Transparency" })
	end,
}
