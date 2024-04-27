return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-lua/plenary.nvim",
	},
	lazy = false,
	keys = {
		{ "<leader>ff", function() require("av223119.functions").find_files() end, desc="Find: Files" },
		{ "<leader>fF", "<cmd>Telescope find_files<CR>", desc="Find: All files" },
		{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc="Find: Grep" },
		{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc="Find: Buffers" },
		{ "<leader>fo", "<cmd>Telescope oldfiles<CR>", desc="Find: Old files" },
	},
	config = function()
		local actions = require("telescope.actions")
		local telescope = require("telescope")
		telescope.setup {
			defaults = {
				mappings = {
					i = {
						["<Esc>"] = actions.close,
						["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
					},
				},
			},
		}
		telescope.load_extension("ui-select")
	end
}
