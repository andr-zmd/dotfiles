return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		close_if_last_window = true,
	},
	lazy = false,
	keys = {
		{ "<leader>ft", "<CMD>Neotree toggle<CR>", desc = "Open Filetree" },
	},
}
