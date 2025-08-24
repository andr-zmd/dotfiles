return {
	"saghen/blink.cmp",

	-- Extra Snippets
	dependencies = {
		"rafamadriz/friendly-snippets",
	},

	version = "1.*",

	config = function()
		--- @module 'blink.cmp'
		--- @type blink.cmp.Config
		require("blink.cmp").setup({
			keymap = { preset = "default" },

			appearance = {
				nerd_font_variant = "mono",
			},

			completion = {
				menu = {
					border = "rounded",
				},
				documentation = { auto_show = true, auto_show_delay_ms = 500, window = { border = "rounded" } },
			},

			cmdline = {
				completion = { menu = { auto_show = true } },
			},

			sources = {
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						-- make lazydev completions top priority (see `:h blink.cmp`)
						score_offset = 100,
					},
				},
			},

			fuzzy = { implementation = "prefer_rust_with_warning" },
		})

		-- Highlight Groups
		vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { link = "FloatBorder" })
	end,
}
