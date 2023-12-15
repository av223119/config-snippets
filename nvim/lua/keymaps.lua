-- vim.keymap.set with expr=true wants a function() object to call
function ifpum(pos, neg)
	return function()
		return vim.fn.pumvisible() == 1 and pos or neg
	end
end
vim.keymap.set("c", "<down>", ifpum("<c-n>", "<down>"), { expr = true })
vim.keymap.set("c", "<up>", ifpum("<c-p>", "<up>"), { expr = true })
vim.keymap.set("c", "<left>", ifpum("<up>", "<left>"), { expr = true })
vim.keymap.set("c", "<right>", ifpum("<down>", "<right>"), { expr = true })

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
