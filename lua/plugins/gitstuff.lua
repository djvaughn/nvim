return {
	{
		"tpope/vim-fugitive",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local gitsigns = require("gitsigns")
			vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk)
		end,
	},
}
