return {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup()

		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close

		dap.configurations.java = {
			{
				-- You need to extend the classPath to list your dependencies.
				-- `nvim-jdtls` would automatically add the `classPaths` property if it is missing
				classPaths = { "target/classes" },

				-- If using multi-module projects, remove otherwise.

				javaExec = "/bin/java",
				mainClass = "${file}",

				-- If using the JDK9+ module system, this needs to be extended
				-- `nvim-jdtls` would automatically populate this property
				modulePaths = {},
				name = "Launch Current File",
				request = "launch",
				type = "java",
			},
		}

		-- Keymaps
		vim.keymap.set("n", "<F5>", function()
			require("dap").continue()
		end, { desc = "Debug: Start/Continue" })
		vim.keymap.set("n", "<F1>", function()
			require("dap").step_into()
		end, { desc = "Debug: Step Into" })
		vim.keymap.set("n", "<F2>", function()
			require("dap").step_over()
		end, { desc = "Debug: Step Over" })
		vim.keymap.set("n", "<F3>", function()
			require("dap").step_out()
		end, { desc = "Debug: Step Out" })
		vim.keymap.set("n", "<Leader>b", function()
			require("dap").toggle_breakpoint()
		end, { desc = "Debug: Toggle Breakpoint" })
		vim.keymap.set("n", "<Leader>B", function()
			require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "Debug: Set Breakpoint" })
	end,
}
