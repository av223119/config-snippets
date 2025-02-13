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
		picker = {
			layout = "bottom",
			prompt = "›",
		},
		input = { icon = "›" },
	},
	keys = function()
		local s = require("snacks")
		return {
			{ "<C-\\>",     function() s.terminal.toggle() end, mode = { "n", "t" }, desc = "Toggle terminal" },
			{ "<leader>ld", function() s.picker.lsp_definitions() end, desc = "LSP: definition" },
			{ "<leader>lr", function() s.picker.lsp_references() end, desc = "LSP: references" },
			{ "<leader>ls", function() s.picker.lsp_symbols { layout = "vscode" } end, desc = "LSP: symbols" },
			{ "<leader>fS", function() s.picker.pickers { layout = "vscode" } end, desc = "Find: pickers" },
			{ "<leader>fb", function() s.picker.buffers() end, desc = "Find: buffers" },
			{ "<leader>fo", function() s.picker.recent() end, desc = "Find: old files" },
			{
				"<leader>fg",
				function()
					return s.git.get_root() and s.picker.git_grep() or s.picker.grep()
				end,
				desc = "Find: grep"
			},
			{
				"<leader>ff",
				function()
					return s.git.get_root() and s.picker.git_files() or s.picker.files()
				end,
				desc = "Find: files"
			},
			{ "<leader>fG", function() s.picker.grep() end, desc = "Find: grep all" },
			{ "<leader>fF", function() s.picker.files() end, desc = "Find: files all" },
		}
	end
}
