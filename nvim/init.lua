-- Options

-- Line Numbers
vim.o.number = true
vim.o.relativenumber = true

-- Indentation
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2

-- UI
vim.o.showmode = false

-- Functionalities
vim.o.undofile = true
vim.g.have_nerd_font = true

-- Leader Keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Keymaps

-- Window Keymaps
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move focus to the lower window" })

-- Autocommands

-- Lazy

-- Bootstrap Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Plug-ins
require("lazy").setup({

	spec = {
		-- Colorscheme
		{
			"rebelot/kanagawa.nvim",
			config = function()
				require("kanagawa").setup({
					overrides = function(colors)
						return {
							StatusLine = { bg = "NONE" },
							StatusLineNC = { bg = "NONE" },
						}
					end,
					theme = "dragon",
				})
				vim.cmd("colorscheme kanagawa-dragon")
			end,
			priority = 1000,
		},

		-- Lua LS Config
		require("plugins.lazydev"),

		-- LSP, DAP, Linters, Formatters

		-- Mason Installer
		require("plugins.mason"),
		-- LSP
		require("plugins.lsp"),
		-- Formatter
		require("plugins.conform"),

		-- Functionalities

		-- Filetree
		require("plugins.neotree"),
		-- Fuzzy Finder
		require("plugins.telescope"),
		-- Better Syntax Highlighting, Editing, and Navigation
		require("plugins.treesitter"),
		-- Status Line
		require("plugins.lualine"),
		-- Autocompletion
		require("plugins.blink"),
		-- Which Key
		require("plugins.which-key"),
		-- Autopairing
		require("plugins.autopairs"),

		-- Discord Presence
		require("plugins.presence"),
	},
	-- automatically check for plugin updates
	checker = { enabled = true },
})
