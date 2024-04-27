--[[
-- Replaced by telescope live_grep
vim.api.nvim_create_user_command(
	"Grep",
	function(opts)
		local t = "git grep"
		local r = vim.fn.systemlist { "git", "--no-pager", "grep", "-n", opts.fargs[1] }
		if vim.v.shell_error == 128 then
			t = "grep"
			r = vim.fn.systemlist { "grep", "-R", "-n", opts.fargs[1], "." }
		end
		vim.fn.setqflist({}, ' ', { lines = r, title = t .. " " .. opts.fargs[1] })
		vim.cmd.cwindow {}
	end,
	{ nargs = 1 }
)
]]

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
		vim.highlight.on_yank { timeout=250 }
	end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
	group = "__custom",
	-- command = [[ silent! normal! g`"zv ]],
	callback = function()
		vim.api.nvim_win_set_cursor(0, vim.api.nvim_buf_get_mark(0, '"'))
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = "__custom",
	callback = function(ev)
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	end,
})
