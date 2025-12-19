return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
	config = function()
		local wk = require("which-key")
		wk.setup({
			preset = "modern",
			win = {
				border = "rounded",
			},
		})

		wk.add({
			{ "<leader>s", group = "[S]earch" },
			{ "<leader>c", group = "[C]ode" },
			{ "<leader>o", group = "[O]pen" },
			{ "<leader>p", group = "[P]references" },
			{ "<leader>d", group = "[D]ebug" },
			{ "<leader>t", group = "[T]est" },
		})
	end,
}
