vim.api.nvim_create_augroup("__custom", {})

vim.api.nvim_create_autocmd("FileType", {
	group = "__custom",
	pattern = { "toml", "cfg", "conf" },
	desc = "expand tabs in toml",
	callback = function()
		vim.bo.expandtab = true
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = "__custom",
	desc = "highlight on yank",
	callback = function()
		vim.highlight.on_yank { timeout = 250 }
	end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
	group = "__custom",
	command = [[ silent! normal! g`"zv ]],
	-- callback = function()
	-- 	vim.api.nvim_win_set_cursor(0, vim.api.nvim_buf_get_mark(0, '"'))
	-- end,
})

vim.api.nvim_create_autocmd("VimEnter", {
	group = "__custom",
	nested = true,
	callback = function()
		pcall(vim.cmd.colorscheme, vim.g.SAVED_COLORSCHEME)
	end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
	group = "__custom",
	callback = function(ev)
		vim.g.SAVED_COLORSCHEME = ev.match
	end,
})
