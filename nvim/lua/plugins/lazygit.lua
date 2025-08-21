return {
	"kdheepak/lazygit.nvim",
	lazy = true,
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	-- optional for floating window border decoration
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	-- setting the keybinding for LazyGit with 'keys' is recommended in
	-- order to load the plugin when the command is run for the first time
	keys = {
		{ "<leader>og", "<Cmd>LazyGit<CR>", desc = "[O]pen [G]it" },
	},
	config = function()
		vim.api.nvim_set_hl(0, "LazyGitFloat", { link = "WindowsNormal" })
		vim.api.nvim_set_hl(0, "LazyGitBorder", { link = "WindowsBorder" })
	end,
}
