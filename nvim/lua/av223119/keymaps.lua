-- vim.keymap.set with expr=true wants a function() object to call
local function has(cond, pos, neg)
	return function()
		return cond() and pos or neg
	end
end

local function pum()
	return vim.fn.pumvisible() == 1
end

vim.keymap.set("c", "<Up>", has(pum, "<C-p>", "<Up>"), { expr = true })
vim.keymap.set("c", "<Down>", has(pum, "<C-n>", "<Down>"), { expr = true })

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "<leader>lR", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set("n", "<leader>lC", vim.lsp.buf.code_action, { desc = "Code_action" })
vim.keymap.set("n", "<leader>lF", vim.lsp.buf.format, { desc = "Format" })
vim.keymap.set("n", "<leader>lh", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
	{ desc = "togge inlay hints" })
