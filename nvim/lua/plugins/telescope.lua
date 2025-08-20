return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		-- Basic telescope keymaps
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search Help" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search Keymaps" })
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Search Files" })
		vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "Search Select Telescope" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search current Word" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Search by Grep" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search Diagnostics" })
		vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "Search Resume" })
		vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = "Search Recent Files" })
		vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "Find Existing Buffers" })
		vim.keymap.set("n", "<leader>sc", builtin.current_buffer_fuzzy_find, { desc = "Search in Current Buffer" })

		-- Highlight Groups
		vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "FloatBorder" })
	end,
}
