vim.api.nvim_create_augroup("__custom", {})

vim.api.nvim_create_autocmd("FileType", {
	group = "__custom",
	pattern = { "json", "toml", "cfg", "conf", "groovy" },
	desc = "expand tabs in toml",
	callback = function()
		vim.bo.expandtab = true
		vim.bo.shiftwidth = 4
		vim.bo.tabstop = 4
	end,
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
	group = "__custom",
	pattern = { "*.jenkinsfile", "Jenkinsfile" },
	desc = "expand tabs in toml",
	callback = function()
		vim.bo.filetype = "groovy"
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
	desc = "return to last cursor position",
	-- command = [[ silent! normal! g`"zv ]],
	callback = function()
		pcall(vim.api.nvim_win_set_cursor, 0, vim.api.nvim_buf_get_mark(0, '"'))
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	group = "__custom",
	desc = "auto-cd to project root",
	callback = function(ev)
		local root = vim.fs.root(ev.buf, {".git", "Makefile", "pyproject.toml"})
		if root then vim.cmd.chdir(root) end
	end,
})

vim.api.nvim_create_autocmd("VimEnter", {
	group = "__custom",
	desc = "apply saved colorscheme",
	nested = true,
	callback = function()
		pcall(vim.cmd.colorscheme, vim.g.SAVED_COLORSCHEME)
	end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
	group = "__custom",
	desc = "save colorscheme",
	callback = function(ev)
		vim.g.SAVED_COLORSCHEME = ev.match
	end,
})
