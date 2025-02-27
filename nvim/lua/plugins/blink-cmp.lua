return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	-- dependencies = "rafamadriz/friendly-snippets",
	version = "*",
	opts = {
		keymap = {
			preset = "super-tab",
		},
		-- signature = {
		-- 	enabled = true,
		-- },
		completion = {
			-- ghost_text = {
			-- 	enabled = true
			-- },
			list = {
				selection = {
					preselect = true,
					auto_insert = false,
				},
			},
		},
		cmdline = {
			keymap = {
				preset = "super-tab",
			},
			completion = {
				menu = { auto_show = true },
			}
		},
	},
}
