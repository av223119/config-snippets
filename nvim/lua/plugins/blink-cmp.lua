return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	-- dependencies = "rafamadriz/friendly-snippets",
	version = "v0.10.0",
	opts = {
		keymap = {
			preset = "super-tab",
		},
		signature = {
			enabled = true,
		},
		completion = {
			-- ghost_text = {
			-- 	enabled = true
			-- },
			-- menu = {
			-- 	border = "single",
			-- },
			list = {
				selection = {
					preselect = true,
					auto_insert = false,
				},
			},
			-- documentation = {
			-- 	auto_show = true,
			-- },
		},
	},
}
