vim.api.nvim_create_autocmd("FileType", {
	once = true,
	group = "__custom",
	pattern = "csv",
	desc = "expand tabs",
	callback = function()
		vim.pack.add { "https://github.com/hat0uma/csvview.nvim" }
		require("csvview").setup {
			parser = {
				comments = { "#" }
			},
			view = {
				display_mode = "border",
			},
		}
	end,
})
