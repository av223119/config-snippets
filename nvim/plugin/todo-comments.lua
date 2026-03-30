vim.pack.add {
	"https://github.com/folke/todo-comments.nvim",
	"https://github.com/nvim-lua/plenary.nvim"
}
require("todo-comments").setup {
	signs = false,
	highlight = {
		after = "",
		comments_only = true,
		keyword = "wide",
	},
}
