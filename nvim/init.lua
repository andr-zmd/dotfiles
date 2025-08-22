-- Options

-- Leader Keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Nerd Font
vim.g.have_nerd_font = true

-- Line Numbers
vim.o.number = true
vim.o.relativenumber = true

-- Indentation
vim.o.breakindent = true
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2

-- Hide built-in mode
vim.o.showmode = false

-- Split windows to the right and bottom
vim.o.splitright = true
vim.o.splitbelow = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching
vim.o.ignorecase = true
vim.o.smartcase = true

-- Update time
vim.o.updatetime = 250

-- Map sequence wait time
vim.o.timeoutlen = 300

-- Preview substitutions
vim.o.inccommand = "split"
-- Keymaps

-- Clear highlights when searching
vim.keymap.set("n", "<Esc>", "<CMD>nohlsearch<CR>")

-- Window Keymaps
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move focus to the lower window" })

-- Autocommands

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when copying",
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Diagnostic | :help vim.diagnostic.Opts
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

		require("plugins.colorscheme.kanagawa"),

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
		-- Autocompletion
		require("plugins.blink"),
		-- Autopairing
		require("plugins.autopairs"),
		-- Sessions
		require("plugins.auto-session"),
		-- Git Signs
		require("plugins.gitsigns"),
		-- Terminals
		require("plugins.lazygit"),

		-- User Interface

		-- Which Key
		require("plugins.which-key"),
		-- Status Line
		require("plugins.lualine"),
		-- Transparency
		require("plugins.transparent"),
		-- Dashboard
		require("plugins.dashboard"),
		-- Smooth Scrolling
		require("plugins.neoscroll"),
		-- Smooth Cursor
		require("plugins.smear-cursor"),
		-- Indent Lines
		require("plugins.indent-blankline"),
		-- UI Tweaks
		require("plugins.noice"),

		-- Discord Presence
		require("plugins.presence"),
	},
	-- automatically check for plugin updates
	checker = { enabled = true },
})
