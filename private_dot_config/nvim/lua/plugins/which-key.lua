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
	opts = {
		preset = "modern",
		delay = 0,

		spec = {
			{ "<leader>s", group = "[S]earch", icon = { icon = "", color = "green" } },
			{ "<leader>t", group = "[T]esting", icon = { icon = "", color = "green" } },
			{ "<leader>o", group = "[O]pen", icon = { icon = "", color = "green" } },
			{ "<leader>p", group = "[P]references", icon = { icon = "", color = "green" } },

			-- Icon Setup
			{ "<leader>og", icon = { icon = "", color = "orange" } },
			{ "<leader>ot", icon = { icon = " ", color = "blue" } },
			{ "<leader>b", icon = { icon = "", color = "red" } },
		},

		icons = {
			group = "+",
		},
	},
}
