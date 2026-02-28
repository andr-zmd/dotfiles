return {
	"nvim-neotest/neotest",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",

		-- Runner adapters
		"rcasia/neotest-java",
	},
	keys = {
		{
			"<leader>tn",
			function()
				require("neotest").run.run()
			end,
			desc = "Run Nearest",
		},
		{
			"<leader>tf",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			desc = "Run File",
		},
		{
			"<leader>dt",
			function()
				require("neotest").run.run({ strategy = "dap" })
			end,
			desc = "Debug Test",
		},
		{
			"<leader>ti",
			function()
				require("neotest").summary.toggle()
			end,
			desc = "Test Info",
		},
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-java"),
			},
			floating = { border = "rounded" },
		})
	end,
}
