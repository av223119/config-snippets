return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			autochdir = true,
			direction = "float",
			open_mapping = "<C-\\>",
			start_in_insert = true,
		})
	end,
}
