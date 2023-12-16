local M = {}

local is_git = {}
local telescope = require("telescope.builtin")

M.find_files = function()
	local opts = {}
	local cwd = vim.fn.getcwd()
	if is_git[cwd] == nil then
		vim.fn.system { "git", "rev-parse", "--is-inside-work-tree" }
		is_git[cwd] = vim.v.shell_error == 0
	end

	if is_git[cwd] then
		telescope.git_files(opts)
	else
		telescope.find_files(opts)
	end
end

return M
