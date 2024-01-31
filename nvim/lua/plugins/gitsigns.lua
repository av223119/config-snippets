return {
	"lewis6991/gitsigns.nvim",
	lazy = false,
	opts = {},
	keys = {
		{ "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", desc="Git: preview hunk" },
		{ "<leader>gb", "<cmd>Gitsigns blame_line full=true<CR>", desc="Git: detailed blame" },
		{ "[g", "<cmd>Gitsigns prev_hunk<CR>", desc="Git: previous hunk" },
		{ "]g", "<cmd>Gitsigns next_hunk<CR>", desc="Git: next hunk" },
	},
}
