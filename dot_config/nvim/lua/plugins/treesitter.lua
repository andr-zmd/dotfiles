return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"bash",
				"c",
				"lua",
				"html",
				"css",
				"javascript",
				"typescript",
				"python",
				"java",
				"markdown",
			},

			highlight = {
				enable = true,
			},

			indent = {
				enable = true,
			},
		})
	end,
}
