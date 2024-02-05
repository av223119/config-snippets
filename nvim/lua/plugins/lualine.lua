return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {
			component_separators = {},
			section_separators = {
				-- left = "",
				-- right = "",
			},
		},
		sections = {
			lualine_a = {
				{
					"mode",
					fmt = function(s) return string.format("%-9s", s) end
				},
			},
			lualine_b = {
				"branch",
			},
		},
	},
}
