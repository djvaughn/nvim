return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				auto_install = true,
				ensure_installed = {
					"bash",
					"diff",
					"luadoc",
					"markdown",
					"markdown_inline",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"python",
					"sql",
					"jsonc",
					"dockerfile",
					"json"
				},
				sync_install = true,
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
			})
		end,
	},
}
