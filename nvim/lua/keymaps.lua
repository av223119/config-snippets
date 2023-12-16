-- vim.keymap.set with expr=true wants a function() object to call
function has(cond, pos, neg)
	return function()
		return cond() and pos or neg
	end
end

function pum()
	return vim.fn.pumvisible() == 1
end

--[[
function quickfix()
	for w = 1, vim.fn.winnr('$') do
		if vim.fn.win_gettype(w) == "quickfix" then
			return true
		end
	end
	return false
end
vim.keymap.set({ "n", "i" }, "<C-up>", has(quickfix, "<cmd>cprev<CR>", nil), { expr = true })
vim.keymap.set({ "n", "i" }, "<C-down>", has(quickfix, "<cmd>cnext<CR>", nil), { expr = true })
--]]

vim.keymap.set("c", "<Up>", has(pum, "<C-p>", "<Up>"), { expr = true })
vim.keymap.set("c", "<Down>", has(pum, "<C-n>", "<Down>"), { expr = true })
vim.keymap.set("c", "<Left>", has(pum, "<Up>", "<Left>"), { expr = true })
vim.keymap.set("c", "<Right>", has(pum, "<Down>", "<Right>"), { expr = true })

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set({ "n", "i" }, "<C-Up>", "<C-w><Up>")
vim.keymap.set({ "n", "i" }, "<C-Down>", "<C-w><Down>")
vim.keymap.set({ "n", "i" }, "<C-Left>", "<C-w><Left>")
vim.keymap.set({ "n", "i" }, "<C-Right>", "<C-w><Right>")

-- vim.keymap.set("n", "<Esc>", "<C-l>", { remap = true })
