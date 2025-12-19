return {
	"jay-babu/mason-nvim-dap.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio", -- Required dependency for dap-ui
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("mason-nvim-dap").setup({
			handlers = {},
		})

		-- Dap UI Listeners
		dapui.setup()
		require("nvim-dap-virtual-text").setup({
			virt_text_pos = "eol",
		})

		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close

		-- Debug Launch Configurations

		-- Java
		dap.configurations.java = {
			{
				mainClass = "${file}",
				name = "Launch Current File",
				request = "launch",
				type = "java",
				projectName = function()
					local cwd_basename = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
					return cwd_basename
				end,
			},
			{
				mainClass = "${file}",
				name = "Launch Current File With Arguments",
				request = "launch",
				args = function()
					local args_string = vim.fn.input("Program Arguments: ")

					return args_string
				end,
				type = "java",
			},
		}

		vim.keymap.set("n", "<F5>", function()
			dap.continue()
		end, { desc = "Debug: Start/Continue" })
		vim.keymap.set("n", "<F10>", function()
			dap.step_over()
		end, { desc = "Debug: Step Over" })
		vim.keymap.set("n", "<F11>", function()
			dap.step_into()
		end, { desc = "Debug: Step Into" })
		vim.keymap.set("n", "<F12>", function()
			dap.step_out()
		end, { desc = "Debug: Step Out" })

		vim.keymap.set("n", "<leader>b", function()
			dap.toggle_breakpoint()
		end, { desc = "[B]reakpoint" })
		vim.keymap.set("n", "<leader>B", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "Conditional [B]reakpoint" })

		vim.keymap.set("n", "<Leader>du", function()
			dapui.toggle()
		end, { desc = "[U]ser Interface" })
	end,
}
