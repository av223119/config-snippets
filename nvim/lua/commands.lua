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

vim.api.nvim_create_augroup("filetypes", {})

vim.api.nvim_create_autocmd("FileType", {
	group = "filetypes",
	pattern = { "toml", "cfg", "conf" },
	desc = "expand tabs in toml",
	callback = function()
		vim.bo.expandtab = true
	end,
})
