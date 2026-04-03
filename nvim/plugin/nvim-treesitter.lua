vim.api.nvim_create_autocmd("PackChanged", {
	desc = "TSUpdate on treesitter update",
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and kind == "update" then
			if not ev.data.active then vim.cmd.packadd("nvim-treesitter") end
			vim.cmd("TSUpdate")
		end
	end
})

vim.pack.add {
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" }
}
local ts = require "nvim-treesitter"
local tsc = require "nvim-treesitter.config"
local group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = group,
	desc = "Enable treesitter",
	callback = function(event)
		local lang = vim.treesitter.language.get_lang(event.match)
		local buf = event.buf
		local i = 0
		if
			not lang
			or vim.tbl_contains(tsc.get_installed(), lang)
			or not vim.tbl_contains(ts.get_available(), lang)
		then
			return
		end
		local timer = vim.uv.new_timer()
		if not timer then
			return
		end
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
