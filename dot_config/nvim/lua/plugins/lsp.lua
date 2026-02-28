return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		"mason-org/mason.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("mason-lspconfig").setup({
			automatic_enable = {
				exclude = {
					"jdtls",
				},
			},
		})

		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code [A]ctions" })
	end,
}
