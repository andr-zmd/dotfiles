return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
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

		-- Keymaps
		vim.keymap.del("n", "grn")
		vim.keymap.del("n", "gra")
		vim.keymap.del("n", "grr")
		vim.keymap.del("n", "gri")
		vim.keymap.del("n", "grt")
		vim.keymap.del("n", "gO")

		vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "[R]ename Variable" })
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code [A]ctions" })

		vim.keymap.set("n", "<leader>sr", require("telescope.builtin").lsp_references, { desc = "[R]eferences" })
		vim.keymap.set(
			"n",
			"<leader>ss",
			require("telescope.builtin").lsp_document_symbols,
			{ desc = "Document [S]ymbols" }
		)

		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to [I]mplementation" })
		vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { desc = "Go to [T]ype Definition" })
	end,
}
