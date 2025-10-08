return {
	"mfussenegger/nvim-jdtls",
	ft = "java",
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
		vim.keymap.set("n", "<leader>cjo", require("jdtls").organize_imports, { desc = "[O]rganize Imports" })
		vim.keymap.set("n", "<leader>cjv", require("jdtls").extract_variable, { desc = "Extract [V]ariable" })
		vim.keymap.set("n", "<leader>cjV", require("jdtls").extract_variable_all, { desc = "Extract [V]ariable All" })
		vim.keymap.set("n", "<leader>cjc", require("jdtls").extract_constant, { desc = "Extract [C]onstant" })
		vim.keymap.set("n", "<leader>cjm", require("jdtls").extract_method, { desc = "Extract [M]ethod" })

		vim.keymap.set("n", "<leader>cjg", require("jdtls.tests").generate, { desc = "[G]enerate Tests" })
	end,
}
