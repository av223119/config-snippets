return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {
			component_separators = {},
			section_separators = {},
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
		winbar = {
			lualine_c = {
				{
					function()
						local loc = require("nvim-navic").get_location()
						return (loc == "" and " ") or loc
					end,
					cond = function()
						local ok, navic = pcall(require, "nvim-navic")
						return ok and navic.is_available()
					end
				},
			}
		}
	},
}
