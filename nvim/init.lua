-- Keymaps
-- vim.keymap.set with expr=true wants a function() object to call
function ifpum(pos, neg)
	return function()
		return vim.fn.pumvisible() == 1 and pos or neg
	end
end
vim.keymap.set("c", "<down>", ifpum("<c-n>", "<down>"), { expr = true })
vim.keymap.set("c", "<up>", ifpum("<c-p>", "<up>"), { expr = true })
vim.keymap.set("c", "<left>", ifpum("<up>", "<left>"), { expr = true })
vim.keymap.set("c", "<right>", ifpum("<down>", "<right>"), { expr = true })

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Options
vim.o.termguicolors = true
vim.o.number = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.scrolloff = 1
vim.o.virtualedit = "block"
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- Ideas
-- vim.o.cursorline = true
-- vim.o.cursorlineopt = "number"
-- vim.o.inccommand

-- Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"mhartington/oceanic-next",
		config = function()
			vim.g.oceanic_next_terminal_bold = true
			vim.g.oceanic_next_terminal_italic = true
		end
	},
	{
		"overcache/NeoSolarized",
		config = function()
			vim.g.neosolarized_italic = true
		end
	},
	{
		"shaunsingh/nord.nvim",
		config = function()
			vim.g.nord_borders = true
			vim.cmd.colorscheme "nord"
		end
	},
})
