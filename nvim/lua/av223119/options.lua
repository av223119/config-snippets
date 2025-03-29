vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menuone" }
vim.opt.cursorlineopt = "number"
vim.opt.cursorline = true
vim.opt.diffopt = {
	"internal",
	"filler",
	"closeoff",
	"algorithm:minimal",
	"linematch:60",
}
vim.opt.ignorecase = true
vim.opt.number = true
vim.opt.path = { ".", "**" }
vim.opt.scrolloff = 4
vim.opt.showmode = false
vim.opt.smartcase = true
vim.opt.virtualedit = "block"
vim.opt.wildignore = { "*/venv/*", "*/.venv/*", "*/__pycache__/*" }
vim.opt.wildmode = "longest:full"

-- save and restore colorscheme, fallback to habamax. `shada` contains `!` by default
vim.g.SAVED_COLORSCHEME = "habamax"

-- Ideas
-- vim.opt.inccommand
-- vim.opt.laststatus = 3

vim.diagnostic.config {
	virtual_text = {
		current_line = true
	}
}
