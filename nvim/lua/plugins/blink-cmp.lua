return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	-- dependencies = "rafamadriz/friendly-snippets",
	version = "v0.9.2",
	opts = {
		keymap = {
			preset = "super-tab",
		},
		completion = {
			-- ghost_text = {
			-- 	enabled = true
			-- },
			-- menu = {
			-- 	auto_show = function(ctx) return ctx.mode == "cmdline" end,
			-- },
			list = {
				selection = function(ctx) return ctx.mode == "cmdline" and "auto_insert" or "preselect" end,
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
			},
		},
	},
}
