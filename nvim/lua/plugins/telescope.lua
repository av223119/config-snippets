return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>ff", function() require("av223119.functions").find_files() end, desc="Find: Files" },
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
}
