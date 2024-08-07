return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup {
			ensure_installed = {
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
		}

		-- folding
		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		vim.opt.foldlevel = 99
	end
}
