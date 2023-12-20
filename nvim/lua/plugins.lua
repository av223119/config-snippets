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
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nightfox").setup({
				options = {
					styles = {
						comments = "italic",
					},
				},
			})
			vim.cmd.colorscheme "terafox"
		end
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"python",
					"bash",
					"markdown",
					"html",
					"htmldjango",
					"diff",
				},
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false
				},
				indent = {
					enable = true
				}
			})
			-- some themes omit diff definitions
			vim.cmd.highlight "def link @text.diff.delete DiffRemoved"
			vim.cmd.highlight "def link @text.diff.add DiffAdded"
		end
	},
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>ff", function() require("av223119").find_files() end, desc="Find: Files" },
			{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc="Find: Grep" },
			{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc="Find: Buffers" },
		},
		config = function()
			actions = require("telescope.actions")
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<Esc>"] = actions.close,
							["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
						},
					},
				},
			})
		end
	},
})
