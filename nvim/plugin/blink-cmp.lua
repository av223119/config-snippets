vim.pack.add {
	{ src = "https://github.com/saghen/blink.cmp", version = "v1" }
}
require("blink.cmp").setup {
	fuzzy = {
		prebuilt_binaries = {
			force_version = "v1.*",
		},
	},
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
}
