return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("mason").setup {}
		require("mason-lspconfig").setup_handlers {
			function(name)
				require("lspconfig")[name].setup {}
			end,
			["basedpyright"] = function()
				require("lspconfig").basedpyright.setup {
					settings = {
						python = {
							pythonPath = "./venv/bin/python",
						},
					}
				}
			end,
		}

		local lsp_keys = {
			{ key = "<leader>lR", func = vim.lsp.buf.rename,           desc = "Rename" },
			{ key = "<leader>lC", func = vim.lsp.buf.code_action,      desc = "Code_action" },
			{ key = "<leader>lF", func = vim.lsp.buf.format,           desc = "Format" },
			{
				key = "<leader>lh",
				func = function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
				end,
				desc = "togge inlay hints"
			},
		}

		vim.api.nvim_create_augroup("lsp_group", {})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = "lsp_group",
			callback = function(ev)
				for _, v in ipairs(lsp_keys) do
					vim.keymap.set("n", v.key, v.func, { buffer = ev.buf, desc = "LSP: " .. v.desc })
				end
			end,
		})

		vim.api.nvim_create_autocmd("LspDetach", {
			group = "lsp_group",
			callback = function(ev)
				for _, v in ipairs(lsp_keys) do
					vim.keymap.del("n", v.key, { buffer = ev.buf })
				end
			end,
		})
	end,
}
