vim.pack.add {
	"https://github.com/folke/snacks.nvim"
}
local s = require "snacks"
s.setup {
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
}
vim.keymap.set({ "n", "t" }, "<C-\\>", s.terminal.toggle, { desc = "Toggle terminal" })
vim.keymap.set("n", "<leader>r", s.picker.resume, { desc = "Resume picker" })
vim.keymap.set("n", "<leader>ld", s.picker.lsp_definitions, { desc = "LSP: definition" })
vim.keymap.set("n", "<leader>lr", s.picker.lsp_references, { desc = "LSP: references" })
vim.keymap.set("n", "<leader>ls", s.picker.lsp_symbols, { desc = "LSP: symbols" })
vim.keymap.set("n", "<leader>li", s.picker.lsp_incoming_calls, { desc = "LSP: incoming calls" })
vim.keymap.set("n", "<leader>lS", s.picker.lsp_workspace_symbols, { desc = "LSP: workspace symbols" })
vim.keymap.set("n", "<leader>fS", function() s.picker.pickers { layout = "vscode" } end, { desc = "Find: pickers" })
vim.keymap.set("n", "<leader>fb", s.picker.buffers, { desc = "Find: buffers" })
vim.keymap.set("n", "<leader>fo", s.picker.recent, { desc = "Find: old files" })
vim.keymap.set("n",
	"<leader>fg",
	function()
		return s.git.get_root() and s.picker.git_grep() or s.picker.grep()
	end,
	{ desc = "Find: grep" }
)
vim.keymap.set("n",
	"<leader>ff",
	function()
		return s.git.get_root() and s.picker.git_files() or s.picker.files()
	end,
	{ desc = "Find: files" }
)
vim.keymap.set("n", "<leader>fG", s.picker.grep, { desc = "Find: grep all" })
vim.keymap.set("n", "<leader>fF", s.picker.files, { desc = "Find: files all" })
vim.keymap.set("n", "<leader>s", function() s.scratch() end, { desc = "Scratch buffer" })
