return {
	"nvim-telescope/telescope.nvim",
	tag = "v0.2.0",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		-- Basic telescope keymaps
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[H]elp" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[K]eymaps" })
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[F]iles" })
		vim.keymap.set("n", "<leader>st", builtin.builtin, { desc = "Select [T]elescope" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[W]ord" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[G]rep" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[D]iagnostics" })
		vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[.] Recent Files ("." for repeat)' })
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

		-- Fuzzy find current buffer
		vim.keymap.set(
			"n",
			"<leader>/",
			builtin.current_buffer_fuzzy_find,
			{ desc = "[/] Fuzzily search in current buffer" }
		)

		-- Grep open files
		vim.keymap.set("n", "<leader>s/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[/] Grep in Open Files" })

		-- Search config files
		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[N]eovim files" })
	end,
}
