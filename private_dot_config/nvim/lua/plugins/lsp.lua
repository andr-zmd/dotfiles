return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "mason-org/mason-lspconfig.nvim", opts = { automatic_enable = { exclude = { "jdtls" } } } },
	},
}
