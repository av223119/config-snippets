vim.pack.add {
	"https://github.com/saghen/blink.lib",
	"https://github.com/saghen/blink.cmp",
}
require("blink.cmp").build():pwait()
require("blink.cmp").setup {
	keymap = {
		preset = "super-tab",
	},
	-- signature = {
	--     enabled = true,
	-- },
	completion = {
		-- ghost_text = {
		--     enabled = true
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
}
