return {
	"mfussenegger/nvim-jdtls",
	ft = "java",
	config = function()
		local function setup_jdtls()
			local jdtls = require("jdtls")

			local bundles = {
				vim.fn.glob(
					"~/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin-*.jar",
					true
				),
			}
			vim.list_extend(bundles, vim.fn.glob("~/.local/share/nvim/mason/share/java-test/*.jar", true, true))

			local config = {
				cmd = { "jdtls" }, -- Or the full path to the mason bin
				root_dir = jdtls.setup.find_root({ ".git", "mvnw", "gradlew" }),
				init_options = {
					bundles = bundles,
				},
				settings = {
					java = {
						-- Required for some advanced features
					},
				},
			}

			jdtls.start_or_attach(config)
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
