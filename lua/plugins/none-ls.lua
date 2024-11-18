return {
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				timeout = 10000,
				sources = {
					null_ls.builtins.formatting.stylua.with({
						timeout = 10000,
					}),
					null_ls.builtins.code_actions.refactoring,
					null_ls.builtins.diagnostics.pylint,
					null_ls.builtins.formatting.isort.with({
						timeout = 10000,
					}),
					null_ls.builtins.formatting.black.with({
						timeout = 10000,
					}),
					null_ls.builtins.diagnostics.mypy,
				},
			})
			vim.keymap.set("n", "<leader>gf", function()
				vim.lsp.buf.format({ timeout_ms = 10000 })
			end, {})
		end,
	},
}
