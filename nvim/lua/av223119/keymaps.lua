-- vim.keymap.set with expr=true wants a function() object to call
local function has(cond, pos, neg)
	return function()
		return cond() and pos or neg
	end
end

local function pum()
	return vim.fn.pumvisible() == 1
end

local function quickfix()
	for w = 1, vim.fn.winnr("$") do
		if vim.fn.win_gettype(w) == "quickfix" then
			return true
		end
	end
	return false
end

vim.keymap.set({ "n", "i" }, "[q", has(quickfix, "<cmd>cprev<CR>", nil), { expr = true })
vim.keymap.set({ "n", "i" }, "]q", has(quickfix, "<cmd>cnext<CR>", nil), { expr = true })

vim.keymap.set("c", "<Up>", has(pum, "<C-p>", "<Up>"), { expr = true })
vim.keymap.set("c", "<Down>", has(pum, "<C-n>", "<Down>"), { expr = true })

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
