return {
	"giuxtaposition/blink-cmp-copilot",
	dependencies = {
		"zbirenbaum/copilot.lua",
		"copilotlsp-nvim/copilot-lsp",
	},
	config = function()
		require("copilot").setup({
			suggestion = { enabled = false },
			panel = { enabled = false },
		})

		vim.api.nvim_create_user_command("Copilot Toggle", function()
			vim.g.copilot_enabled = not vim.g.copilot_enabled

			if vim.g.copilot_enabled then
				vim.cmd("Copilot enable")
				print("Copilot Enabled")
			else
				vim.cmd("Copilot disable")
				print("Copilot Disabled")
			end
		end, { nargs = 0 })

		vim.keymap.set("n", "<leader>pc", ":Copilot Toggle<CR>", { desc = "Toggle Copilot" })
	end,
}
