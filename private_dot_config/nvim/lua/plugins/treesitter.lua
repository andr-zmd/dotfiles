return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = { "lua", "javascript", "regex", "vim", "bash", "markdown", "markdown_inline", "html" },

		auto_install = true,

		-- Modules
		highlight = { enable = true },
		indent = {
			enable = true,
		},
	},
}
