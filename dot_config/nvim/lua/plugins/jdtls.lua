return {
	"mfussenegger/nvim-jdtls",
	ft = "java",
	config = function()
		local function setup_jdtls()
			local bundles = {
				vim.fn.glob(
					"~/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin-*.jar",
					true
				),
			}
			vim.list_extend(bundles, vim.fn.glob("~/.local/share/nvim/mason/share/java-test/*.jar", true, true))

			local config = {
				init_options = {
					bundles = bundles,
				},
				settings = {
					java = {
						-- Required for some advanced features
					},
				},
			}

			vim.lsp.config("jdtls", config)
			vim.lsp.enable("jdtls")
		end

		setup_jdtls()

		-------------
		-- Keymaps --
		-------------

		vim.keymap.set("n", "<leader>tg", function()
			require("jdtls.tests").generate()
		end, { desc = "Generate Tests" })
	end,
}
