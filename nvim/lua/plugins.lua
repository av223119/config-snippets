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
