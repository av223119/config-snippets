return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	branch = "main",
	config = function()
		local ts = require "nvim-treesitter"
		ts.install {
			"bash",
			"diff",
			"html",
			"htmldjango",
			"json",
			"lua",
			"markdown",
			"python",
			"query",
			"toml",
			"vim",
			"vimdoc",
		}
		local group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true })
		vim.api.nvim_create_autocmd('FileType', {
			group = group,
			desc = "Enable treesitter",
			callback = function(event)
				local lang = vim.treesitter.language.get_lang(event.match)
				local buf = event.buf
				local i = 0
				local timer = vim.uv.new_timer()
				ts.install { lang }
				timer:start(0, 1000, vim.schedule_wrap(function()
					i = i + 1
					if i > 60 or not vim.api.nvim_buf_is_valid(buf)
					then
						timer:close()
						return
					end
					if vim.list_contains(ts.get_installed(), vim.treesitter.language.get_lang(lang))
					then
						timer:close()
						vim.treesitter.start(buf)
						vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
						vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
						vim.wo.foldmethod = "expr"
						vim.wo.foldlevel = 99
					end
				end))
			end,
		})
	end,
}
