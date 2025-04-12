return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- LSP source
		"hrsh7th/cmp-buffer", -- Buffer source
		"hrsh7th/cmp-path", -- Path completions
		"L3MON4D3/LuaSnip", -- Snippet engine (required!)
		"saadparwaiz1/cmp_luasnip", -- LuaSnip completion source
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			},
			window = {
				completion = cmp.config.window.bordered(), -- <-- bordered completion
				documentation = cmp.config.window.bordered(), -- <-- bordered docs
			},
			vim.cmd([[
        highlight! link CmpItemAbbr Normal
        highlight! link CmpItemAbbrMatch Keyword
        highlight! link CmpItemAbbrMatchFuzzy Keyword
        highlight! link CmpItemKind Type
        highlight! link CmpItemMenu Comment
        highlight! link Pmenu NormalFloat
        highlight! link PmenuSel Visual
        highlight! link PmenuBorder FloatBorder
      ]]),
		})
	end,
}
