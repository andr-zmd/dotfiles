return {
	"stevearc/conform.nvim",
	event = "BufEnter",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettierd" },
			sh = { "shfmt" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
