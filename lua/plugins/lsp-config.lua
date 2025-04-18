return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				-- ensure_install = {
				-- 	"lua_ls",
				-- 	"pyright",
				-- 	"pylint",
				-- 	"dockerls",
				-- 	"jsonls",
				-- 	"black",
				-- 	"isort",
				-- 	"mypy",
				-- 	"hadolint",
				-- },
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				"lua_ls",
				"pyright",
				"dockerls",
				"jsonls",
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
			lspconfig.pyright.setup({
				settings = {
					python = {
						pythonPath = "/usr/local/bin/python3",
						analysis = {
							autoImportCompletions = true, -- Enable auto-import completion
							autoSearchPaths = true, -- Automatically search paths for imports
							typeCheckingMode = "basic",
							diagnosticMode = "workspace",
						},
					},
					["pyright"] = {},
				},
				capabilities = capabilities,
			})
			lspconfig.dockerls.setup({
				settings = {
					["dockerls"] = {},
				},
				capabilities = capabilities,
			})
			lspconfig.jsonls.setup({
				settings = {
					["jsonls"] = {},
				},
				capabilities = capabilities,
			})
			lspconfig.r_language_server.setup({
				settings = {
					["r_language_server"] = {},
				},
				capabilities = capabilities,
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
		end,
	},
}
