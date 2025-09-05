return {
	"mason-org/mason.nvim",
	dependencies = {
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
	},
	config = function()
		require("mason").setup({})
		require("mason-tool-installer").setup({
			ensure_installed = {
				-- LSP
				"lua-language-server",
				"typescript-language-server",
				"pyright",
				"jdtls",
				-- DAP

				-- Linters
				"eslint-lsp",

				-- Formatters
				"stylua",
				"prettierd",
			},
		})
	end,
}
