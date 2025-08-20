return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		auto_clean_after_session_restore = true, -- Automatically clean up broken neo-tree buffers saved in sessions
		close_if_last_window = true,
	},
	lazy = false,
	keys = {
		{ "<leader>tf", "<Cmd>Neotree toggle<Cr>", desc = "Toggle Filetree" },
	},
}
