return {
	"mfussenegger/nvim-jdtls",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	config = function()
		local bundles = {
			vim.fn.glob(
				"~/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin-*.jar",
				true
			),
		}

		vim.lsp.config("jdtls", {
			root_dir = vim.fs.root(0, { "pom.xml" }),

			settings = {
				java = {
					-- Custom eclipse.jdt.ls options go here
				},
			},

			init_options = {
				bundles = bundles,
			},
		})

		vim.lsp.enable("jdtls")

		-- Keymaps
	end,
}
