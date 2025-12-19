-- Options

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Nerd Font
vim.g.have_nerd_font = true

-- Line Number
vim.o.number = true
vim.o.relativenumber = true

vim.opt.fillchars:append({ eob = " " })

-- Indentation
vim.o.breakindent = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.smarttab = true

-- Split
vim.o.splitright = true
vim.o.splitbelow = true

-- Undo History
vim.o.undofile = true

-- Spell Checking
vim.o.spell = true

-- Keymaps
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<Cr>")

-- Navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move focus to the lower window" })

-- Windows and Tabs
vim.keymap.set("n", "<Leader>wsv", "<C-w>v", { desc = "[V]ertical" })
vim.keymap.set("n", "<Leader>wsh", "<C-w>s", { desc = "[H]orizontal" })
vim.keymap.set("n", "<Leader>wse", "<C-w>=", { desc = "[E]qual" })
vim.keymap.set("n", "<Leader>w+", "<C-w>+", { desc = "Increase Height" })
vim.keymap.set("n", "<Leader>w-", "<C-w>-", { desc = "Decrease Height" })
vim.keymap.set("n", "<Leader>w>", "<C-w>>", { desc = "Increase Width" })
vim.keymap.set("n", "<Leader>w<", "<C-w><", { desc = "Decrease Width" })

-- Diagnostics
vim.diagnostic.config({
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	underline = { severity = vim.diagnostic.severity.ERROR },
	signs = vim.g.have_nerd_font and {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
	} or {},
	virtual_text = {
		source = "if_many",
		spacing = 2,
		format = function(diagnostic)
			local diagnostic_message = {
				[vim.diagnostic.severity.ERROR] = diagnostic.message,
				[vim.diagnostic.severity.WARN] = diagnostic.message,
				[vim.diagnostic.severity.INFO] = diagnostic.message,
				[vim.diagnostic.severity.HINT] = diagnostic.message,
			}
			return diagnostic_message[diagnostic.severity]
		end,
	},
})

-- Bootstrap lazy.nvim
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

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{ import = "plugins" },
		{ import = "plugins.colorschemes" },
	},

	ui = {
		border = "rounded",
	},

	checker = { enabled = true },
})
