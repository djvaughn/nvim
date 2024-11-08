return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_install = {
					"lua_ls",
					"grammarly",
					"pyright",
					"mypy",
					"dockerls",
					"jsonls",
					"prettier",
				},
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				settings = {
					["lua_ls"] = {},
				},
				capabilities = capabilities,
			})
			lspconfig.grammarly.setup({
				settings = {
					["grammarly"] = {},
				},
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				settings = {
					python = {
						pythonPath = '/usr/local/bin/python',
						autoSearchPaths = true,
						useLibraryCodeForTypes = true,
					},
					["pyright"] = {},
				},
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				settings = {
					["dockerls"] = {},
				},
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				settings = {
					["jsonls"] = {},
				},
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				settings = {
					["prettier"] = {},
				},
				capabilities = capabilities,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
