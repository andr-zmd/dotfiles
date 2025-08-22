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
				-- Telescope
				"TelescopeNormal",
				"TelescopeBorder",

				-- WhichKey
				"WhichKeyNormal",
				"WhichKeyBorder",
				"WhichKeyTitle",

				-- Tabline
				"TabLineFill",
				"TabLine",
				"TabLineSel",
			},
			-- table: groups you don't want to clear
			exclude_groups = {},
			-- function: code to be executed after highlight groups are cleared
			-- Also the user event "TransparentClear" will be triggered
			on_clear = function() end,
		})

		vim.keymap.set("n", "<leader>tt", function()
			vim.cmd(":TransparentToggle")
			-- Fix Transparency for Kanagawa-dragon
			if vim.g.colors_name == "kanagawa" then
				vim.cmd(":colorscheme kanagawa-dragon")
			end
		end, { desc = "[T]oggle [T]ransparency" })
	end,
}
