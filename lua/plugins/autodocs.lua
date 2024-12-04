return {
	"danymat/neogen",
	config = function()
		local neogen = require("neogen")
		neogen.setup({
			snippet_engine = "luasnip",
			enable = true,
			languages = {
				python = {
					template = {
						annotation_convention = "numpydoc",
					},
				},
			},
		})
		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<leader>nf", function()
			neogen.generate()
		end, opts)
		vim.keymap.set("n", "<leader>nc", function()
			neogen.generate({ type = "class" })
		end, opts)
		vim.keymap.set("n", "<leader>nF", function()
			neogen.generate({ type = "file" })
		end, opts)
	end,
}
