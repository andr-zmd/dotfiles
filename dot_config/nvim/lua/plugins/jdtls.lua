return {
	"mfussenegger/nvim-jdtls",
	ft = "java",
	config = function()
		local jtest = require("jdtls.tests")
		vim.keymap.set("n", "<Leader>tg", jtest.generate, { desc = "[G]enerate Java Test" })
	end,
}
