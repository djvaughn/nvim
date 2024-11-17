return {
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
		},
		config = function()
			local ufo = require("ufo")
			vim.opt.foldlevel = 99
			vim.opt.foldlevelstart = 99
			vim.opt.foldcolumn = "1"
			vim.opt.foldenable = true

			vim.keymap.set("n", "zR", ufo.openAllFolds, { desc = "󱃄 Open All Folds" })
			vim.keymap.set("n", "zr", ufo.openFoldsExceptKinds, { desc = "󱃄 Open Folds(not comments or imports)" })
			vim.keymap.set("n", "zM", ufo.closeAllFolds, { desc = "󱃄 Close All Folds" })
			vim.keymap.set("n", "z?", vim.cmd.UfoInspect, { desc = "󱃄 :UfoInspect" })
			vim.keymap.set("n", "z1", ufo.closeFoldsWith, { desc = "󱃄 Close folds" })
			vim.keymap.set("n", "zK", function()
				ufo.peekFoldedLinesUnderCursor()
				if not ufo then
					vim.lsp.buf.hover()
				end
			end, { desc = "Peek Fold" })
			ufo.setup({
				provider_selector = function(bufnr, filetype, buftype)
					return { "lsp", "indent" }
				end,
			})
		end,
	},
}
