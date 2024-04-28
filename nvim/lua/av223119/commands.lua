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
		vim.highlight.on_yank { timeout = 250 }
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
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf })
		vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { buffer = ev.buf, desc = "LSP: definiton" })
		vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, { buffer = ev.buf, desc = "LSP: references" })
		vim.keymap.set("n", "<leader>li", vim.lsp.buf.incoming_calls, { buffer = ev.buf, desc = "LSP: incoming calls" })
		vim.keymap.set("n", "<leader>lR", vim.lsp.buf.rename, { buffer = ev.buf, desc = "LSP: Rename" })
		vim.keymap.set("n", "<leader>lC", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "LSP: Code_action" })
		vim.keymap.set("n", "<leader>lF", vim.lsp.buf.format, { buffer = ev.buf, desc = "LSP: Format" })
	end,
})

vim.api.nvim_create_autocmd("LspDetach", {
	group = "__custom",
	callback = function(ev)
		vim.keymap.del("n", "K", { buffer = ev.buf })
		vim.keymap.del("n", "<leader>ld", { buffer = ev.buf })
		vim.keymap.del("n", "<leader>lr", { buffer = ev.buf })
		vim.keymap.del("n", "<leader>li", { buffer = ev.buf })
		vim.keymap.del("n", "<leader>lR", { buffer = ev.buf })
		vim.keymap.del("n", "<leader>lC", { buffer = ev.buf })
		vim.keymap.del("n", "<leader>lF", { buffer = ev.buf })
	end,
})
