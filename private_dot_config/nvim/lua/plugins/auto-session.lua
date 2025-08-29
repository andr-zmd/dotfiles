return {
	"rmagatti/auto-session",
	lazy = false,

	config = function()
		---enables autocomplete for opts
		---@module "auto-session"
		---@type AutoSession.Config
		require("auto-session").setup({
			-- Saving/Restoring
			auto_restore = false,

			-- Filtering
			suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			-- log_level = 'debug',

			-- Commands
			pre_save_cmds = { "Neotree close" },
			post_restore_cmds = { "Neotree filesystem show" },
		})
	end,
}
