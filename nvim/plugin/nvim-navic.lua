vim.pack.add {
	"https://github.com/smiteshp/nvim-navic",
}
require("nvim-navic").setup {
	lsp = {
		auto_attach = true,
		preference = nil,
	},
	separator = " > ",
}
