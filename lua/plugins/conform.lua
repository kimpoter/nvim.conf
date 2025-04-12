return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			json = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			markdown = { "prettier" },
			go = { "goimports", "gofmt" }, -- You can change order of preference
			rust = { "rustfmt" },
			solidity = { "prettier" }, -- Requires Prettier plugin with Solidity support
		},
		format_on_save = { timeout_ms = 500, lsp_fallback = true },
	},
}
