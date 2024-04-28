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

-- LSP keybindings
local lsp_keys = {
	{ mode = "n", key = "K",          func = vim.lsp.buf.hover,          desc = "" },
	{ mode = "n", key = "<leader>ld", func = vim.lsp.buf.definition,     desc = "LSP: definiton" },
	{ mode = "n", key = "<leader>lr", func = vim.lsp.buf.references,     desc = "LSP: references" },
	{ mode = "n", key = "<leader>li", func = vim.lsp.buf.incoming_calls, desc = "LSP: incoming calls" },
	{ mode = "n", key = "<leader>lR", func = vim.lsp.buf.rename,         desc = "LSP: Rename" },
	{ mode = "n", key = "<leader>lC", func = vim.lsp.buf.code_action,    desc = "LSP: Code_action" },
	{ mode = "n", key = "<leader>lF", func = vim.lsp.buf.format,         desc = "LSP: Format" },
}

vim.api.nvim_create_autocmd("LspAttach", {
	group = "__custom",
	callback = function(ev)
		for _, v in ipairs(lsp_keys) do
			vim.keymap.set(v.mode, v.key, v.func, { buffer = ev.buf, desc = v.desc })
		end
	end,
})

vim.api.nvim_create_autocmd("LspDetach", {
	group = "__custom",
	callback = function(ev)
		for _, v in ipairs(lsp_keys) do
			vim.keymap.del(v.mode, v.key, { buffer = ev.buf })
		end
	end,
})
