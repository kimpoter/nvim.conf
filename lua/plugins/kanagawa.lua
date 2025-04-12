return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		transparent = true,
		theme = "dragon",
		background = {
			dark = "dragon",
		},
	},
	config = function(_, opts)
		require("kanagawa").setup(opts)
		vim.cmd([[colorscheme kanagawa]])
	end,
}
