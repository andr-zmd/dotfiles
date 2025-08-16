return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = { "lua", "javascript" },

		auto_install = true,

		-- Modules
		highlight = { enable = true },
		indent = {
			enable = true,
		},
	},
}
