return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		signs = false,
		highlight = {
			after = "",
			comments_only = true,
			keyword = "wide",
		},
	},
}
