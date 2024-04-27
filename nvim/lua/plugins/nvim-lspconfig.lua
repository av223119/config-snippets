return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("mason").setup {}
		require("mason-lspconfig").setup_handlers {
			function(name)
				require("lspconfig")[name].setup {}
			end,
		}
	end,
}
