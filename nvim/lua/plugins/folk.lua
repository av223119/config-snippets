return {
	"folksoftware/nvim",
	name = "folk",
	opts = {
		styles = {
			comments = { "italic" },
			conditionals = {},
		},
		lsp_styles = {
			underlines = {
				errors = { "undercurl" },
				hints = { "undercurl" },
				warnings = { "undercurl" },
				information = { "undercurl" },
				ok = { "undercurl" },
			},
		},
	},
}
