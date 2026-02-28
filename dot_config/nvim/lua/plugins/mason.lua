return {
	"williamboman/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup({
			ui = { border = "rounded" },
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				-- LSP servers
				"jdtls",
				"basedpyright",
				"lua_ls",

				-- Debug adapters
				"java-debug-adapter",
				"debugpy",
				"java-test",

				-- Linters and formatters
				"stylua",
				"google-java-format",
			},
		})
	end,
}
