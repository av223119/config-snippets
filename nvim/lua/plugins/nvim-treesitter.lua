return {
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

		-- folding
		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		vim.opt.foldlevel = 99
	end
}
