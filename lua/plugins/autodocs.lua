return {
	"danymat/neogen",
	config = function()
		local neogen = require("neogen")
		neogen.setup({
			snippet_engine = "luasnip",
			enable = true,
			input_after_comment = true,
			languages = {
				python = {
					annotation_convention = "numpydoc",
				},
			},
		})
		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<leader>nf", ":lua require('neogen').generate()<CR>", opts)
		vim.keymap.set("n", "<leader>nc", ":lua require('neogen').generate({ type = 'class' })<CR>", opts)
		vim.api.nvim_set_keymap("i", "<C-l>", ":lua require('neogen').jump_next<CR>", opts)
		vim.api.nvim_set_keymap("i", "<C-h>", ":lua require('neogen').jump_prev<CR>", opts)
	end,
}
