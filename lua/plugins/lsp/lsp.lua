-- plugins/lsp.lua

local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

-- Initialize Mason
mason.setup()

-- Setup Mason LSP
mason_lspconfig.setup({
	ensure_installed = {
		"lua_ls",
		"svelte",
		"solidity",
		"ts_ls",
		"html",
		"cssls",
		"gopls",
		"rust_analyzer",
		"tinymist",
	},
})

-- Capabilities (with cmp support if available)
local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if ok_cmp then
	capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

-- on_attach function for keymaps
local on_attach = function(_, bufnr)
	local map = function(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
	end

	map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
	map("n", "K", vim.lsp.buf.hover, "Hover")
	map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
	map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
	map("n", "gr", vim.lsp.buf.references, "References")
	-- map("n", "<leader>f", function()
	-- 	vim.lsp.buf.format({ async = true })
	-- end, "Format")
end

-- Per-server optional configs
local servers = {
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
				workspace = { checkThirdParty = false },
			},
		},
	},
	tinymist = {
		settings = {
			formatterMode = "typstyle",
			-- exportPdf = "onType",
			semanticTokens = "disable",
		},
	},
}

-- Setup LSP servers with merged defaults
mason_lspconfig.setup_handlers({
	function(server_name)
		local opts = vim.tbl_deep_extend("force", {
			on_attach = on_attach,
			capabilities = capabilities,
		}, servers[server_name] or {})

		lspconfig[server_name].setup(opts)
	end,
})
