vim.api.nvim_create_user_command(
	"Grep",
	function(opts)
		local r
		r = vim.fn.systemlist { "git", "--no-pager", "grep", "-n", opts.fargs[1] }
		if vim.v.shell_error == 128 then
			r = vim.fn.systemlist { "grep", "-R", "-n", opts.fargs[1], "." }
		end
		vim.fn.setqflist({}, ' ', { lines = r, title = opts.fargs[1] })
		vim.cmd.cwindow {}
	end,
	{ nargs = 1 }
)