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
		end, { desc = "[B]eakpoint" })
		-- vim.keymap.set("n", "<Leader>B", function()
		-- 	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
		-- end, { desc = "Debug: Set Breakpoint" })

		-- Sign Config
		-- dap.txt SIGNS CONFIG
		vim.api.nvim_set_hl(0, "DapBreak", { fg = "#c4746e" })
		vim.api.nvim_set_hl(0, "DapStop", { fg = "#b6927b" })
		local breakpoint_icons = vim.g.have_nerd_font
				and {
					Breakpoint = "",
					BreakpointCondition = "",
					BreakpointRejected = "",
					LogPoint = "",
					Stopped = "",
				}
			or {
				Breakpoint = "●",
				BreakpointCondition = "⊜",
				BreakpointRejected = "⊘",
				LogPoint = "◆",
				Stopped = "⭔",
			}
		for type, icon in pairs(breakpoint_icons) do
			local tp = "Dap" .. type
			local hl = (type == "Stopped") and "DapStop" or "DapBreak"
			vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
		end
	end,
}
