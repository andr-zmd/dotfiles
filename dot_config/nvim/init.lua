----------------------
-- Options & Globals--
----------------------

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Shared options
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff = 10
vim.opt.timeoutlen = 300

if not vim.g.vscode then
	-- TERMINAL ONLY SETTINGS
	vim.g.have_nerd_font = true
	vim.opt.relativenumber = true
	vim.opt.signcolumn = "yes"
	vim.opt.showmode = false
	vim.opt.undofile = true
else
	-- VSCODE ONLY SETTINGS
end

-------------
-- Keymaps --
-------------

vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<Cr>")

if not vim.g.vscode then
	-- TERMINAL KEYMAPS
	vim.keymap.set("n", "<C-h>", "<C-w>h")
	vim.keymap.set("n", "<C-l>", "<C-w>l")
	vim.keymap.set("n", "<C-k>", "<C-w>k")
	vim.keymap.set("n", "<C-j>", "<C-w>j")
else
	-- VSCODE KEYMAPS
	local vscode = require("vscode-neovim")

	-- File Explorer
	vim.keymap.set("n", "<Leader>e", function()
		vscode.action("workbench.view.explorer")
	end)

	-- Split navigation (Focusing Groups)
	vim.keymap.set("n", "<C-h>", function()
		vscode.action("workbench.action.focusLeftGroup")
	end)
	vim.keymap.set("n", "<C-l>", function()
		vscode.action("workbench.action.focusRightGroup")
	end)
	vim.keymap.set("n", "<C-k>", function()
		vscode.action("workbench.action.focusAboveGroup")
	end)
	vim.keymap.set("n", "<C-j>", function()
		vscode.action("workbench.action.focusBelowGroup")
	end)

	-- Split creation
	vim.keymap.set("n", "<Leader>wsv", function()
		vscode.action("workbench.action.splitEditorRight")
	end)
	vim.keymap.set("n", "<Leader>wsh", function()
		vscode.action("workbench.action.splitEditorDown")
	end)
end

---------------------------
-- Diagnostics / Plugins --
---------------------------

if not vim.g.vscode then
	vim.diagnostic.config({
		update_in_insert = false,
		severity_sort = true,
		float = { border = "rounded", source = "if_many" },
		underline = { severity = vim.diagnostic.severity.ERROR },

		-- Can switch between these as you prefer
		virtual_text = true, -- Text shows up at the end of the line
		virtual_lines = false, -- Teest shows up underneath the line, with virtual lines

		-- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
		jump = { float = true },
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
			-- import your plugins
			{ import = "plugins" },
			{ import = "plugins.colorschemes" },
		},
		-- Configure any other settings here. See the documentation for more details.
		-- colorscheme that will be used when installing plugins.
		install = { colorscheme = { "habamax" } },
		-- automatically check for plugin updates
		checker = { enabled = true },
	})
end
