return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		indent = {
			animate = { enabled = false },
			scope = { enabled = false },
		},
		terminal = {},
		picker = { layout = "bottom" },
		input = {},
	},
	keys = {
		{ "<C-\\>", function() Snacks.terminal.toggle() end, mode = { "n", "t" }, desc = "Toggle terminal" },
		{ "<leader>ld", function() Snacks.picker.lsp_definitions() end, desc = "LSP: definition" },
		{ "<leader>lr", function() Snacks.picker.lsp_references() end, desc = "LSP: references" },
		{ "<leader>fb", function() Snacks.picker.buffers() end, desc = "Find: buffers" },
		{ "<leader>fo", function() Snacks.picker.recent() end, desc = "Find: old files" },
		{ "<leader>fg",
			function()
				return Snacks.git.get_root() and Snacks.picker.git_grep() or Snacks.picker.grep()
			end,
			desc = "Find: grep"
		},
		{ "<leader>ff",
			function()
				return Snacks.git.get_root() and Snacks.picker.git_files() or Snacks.picker.files()
			end,
			desc = "Find: files"
		},
		{ "<leader>fG", function() Snacks.picker.grep() end, desc = "Find: grep all" },
		{ "<leader>fF", function() Snacks.picker.files() end, desc = "Find: files all" },
	},
}
