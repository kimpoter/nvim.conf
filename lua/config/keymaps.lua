vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", { desc = "Open parent dir. in floating oil" })
vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({ lsp_format = "fallback" })
end, { desc = "Format current file " })
