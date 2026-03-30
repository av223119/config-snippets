vim.pack.add { "https://github.com/lewis6991/gitsigns.nvim" }
vim.keymap.set("n", "<leader>gb", require("gitsigns").toggle_current_line_blame, { desc = "Git: toggle blame" })
vim.keymap.set("n",
	"<leader>gB",
	function()
		require("gitsigns").blame_line { full = true }
	end,
	{ desc = "Git: full blame" })
-- TODO: [g prev_hunk ]g next_hunk
