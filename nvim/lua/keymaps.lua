-- vim.keymap.set with expr=true wants a function() object to call
function has(cond, pos, neg)
	return function()
		return cond() and pos or neg
	end
end

function pum()
	return vim.fn.pumvisible() == 1
end

function quickfix()
	for w = 1, vim.fn.winnr('$') do
		if vim.fn.win_gettype(w) == "quickfix" then
			return true
		end
	end
	return false
end

vim.keymap.set("c", "<down>", has(pum, "<c-n>", "<down>"), { expr = true })
vim.keymap.set("c", "<up>", has(pum, "<c-p>", "<up>"), { expr = true })
vim.keymap.set("c", "<left>", has(pum, "<up>", "<left>"), { expr = true })
vim.keymap.set("c", "<right>", has(pum, "<down>", "<right>"), { expr = true })

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set({ "n", "i" }, "<C-up>", has(quickfix, "<cmd>cprev<CR>", nil), { expr = true })
vim.keymap.set({ "n", "i" }, "<C-down>", has(quickfix, "<cmd>cnext<CR>", nil), { expr = true })
