return {
	{
		"rcasia/neotest-java",
		ft = "java",
		dependencies = {
			"mfussenegger/nvim-jdtls",
			"mfussenegger/nvim-dap", -- for the debugger
			"rcarriga/nvim-dap-ui", -- recommended
			"theHamsta/nvim-dap-virtual-text", -- recommended
		},
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-java")({}),
				},
				floating = {
					border = "rounded",
				},
			})

			-- Keymaps
			vim.keymap.set("n", "<Leader>tr", function()
				require("neotest").run.run()
			end, { desc = "[R]un Nearest Test" })

			vim.keymap.set("n", "<Leader>tf", function()
				require("neotest").run.run(vim.fn.expand("%"))
			end, { desc = "Run All Test in [F]ile" })

			vim.keymap.set("n", "<Leader>dt", function()
				require("neotest").run.run({ strategy = "dap" })
			end, { desc = "[D]ebug Nearest Test" })

			vim.keymap.set("n", "<Leader>tx", function()
				require("neotest").run.stop()
			end, { desc = "[S]top Nearest Test" })

			vim.keymap.set("n", "<Leader>ta", function()
				require("neotest").run.attach()
			end, { desc = "[A]ttach To Nearest" })

			vim.keymap.set("n", "<Leader>tw", function()
				require("neotest").watch.watch()
			end, { desc = "[W]atch Tests" })

			vim.keymap.set("n", "<Leader>to", function()
				require("neotest").output.open({ enter = true })
			end, { desc = "Check [O]utput" })

			vim.keymap.set("n", "<Leader>tp", function()
				require("neotest").output_panel.toggle()
			end, { desc = "Output [P]anel" })

			vim.keymap.set("n", "<Leader>ts", function()
				require("neotest").summary.toggle()
			end, { desc = "[S]ummary Window" })
		end,
	},
}
