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
		}

		local telescope = require("telescope.builtin")
		local lsp_keys = {
			{ mode = "n", key = "<leader>ld", func = telescope.lsp_definitions,    desc = "LSP: definiton" },
			{ mode = "n", key = "<leader>lr", func = telescope.lsp_references,     desc = "LSP: references" },
			{ mode = "n", key = "<leader>li", func = telescope.lsp_incoming_calls, desc = "LSP: incoming calls" },
			{ mode = "n", key = "<leader>lR", func = vim.lsp.buf.rename,           desc = "LSP: Rename" },
			{ mode = "n", key = "<leader>lC", func = vim.lsp.buf.code_action,      desc = "LSP: Code_action" },
			{ mode = "n", key = "<leader>lF", func = vim.lsp.buf.format,           desc = "LSP: Format" },
			{
				mode = "n",
				key = "<leader>lh",
				func = function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
				end,
				desc = "LSP: togge inlay hints"
			},
		}

		vim.api.nvim_create_augroup("lsp_group", {})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = "lsp_group",
			callback = function(ev)
				for _, v in ipairs(lsp_keys) do
					vim.keymap.set(v.mode, v.key, v.func, { buffer = ev.buf, desc = v.desc })
				end
			end,
		})

		vim.api.nvim_create_autocmd("LspDetach", {
			group = "lsp_group",
			callback = function(ev)
				for _, v in ipairs(lsp_keys) do
					vim.keymap.del(v.mode, v.key, { buffer = ev.buf })
				end
			end,
		})
	end,
}
