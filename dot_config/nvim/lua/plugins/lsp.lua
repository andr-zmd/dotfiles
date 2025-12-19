return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		"mason-org/mason.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("mason-lspconfig").setup({
			automatic_enable = true,
		})

		-- Java Setup

		-- This bundles definition is the same as in the previous section (java-debug installation)
		local bundles = {
			vim.fn.glob(
				"~/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin-*.jar",
				true
			),
		}

		-- This is the new part
		local java_test_bundles =
			vim.split(vim.fn.glob("~/.local/share/nvim/mason/packages/java-test/extension/server/*.jar", true), "\n")
		local excluded = {
			"com.microsoft.java.test.runner-jar-with-dependencies.jar",
			"jacocoagent.jar",
		}
		for _, java_test_jar in ipairs(java_test_bundles) do
			local fname = vim.fn.fnamemodify(java_test_jar, ":t")
			if not vim.tbl_contains(excluded, fname) then
				table.insert(bundles, java_test_jar)
			end
		end
		-- End of the new part

		vim.lsp.config("jdtls", {
			init_options = {
				bundles = bundles,
			},
		})

		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code [A]ctions" })
	end,
}
