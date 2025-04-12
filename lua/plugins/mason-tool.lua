return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = { "williamboman/mason.nvim" },
	opts = {
		ensure_installed = {
			"prettier",
			"stylua",
			"eslint_d",
			"goimports",
			"gofumpt",
			"tailwindcss-language-server",
		},
		auto_update = false,
		run_on_start = true,
	},
}
