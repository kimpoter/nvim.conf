return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp", -- optional, for completion
	},
	config = function()
		require("plugins.lsp.lsp") -- or the path where you saved it
	end,
}
