return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"nvim-tree/nvim-web-devicons", -- optional
		},
		config = function()
			require("telescope").setup({
				defaults = {
					prompt_prefix = "🔍 ",
					selection_caret = " ",
					layout_config = {
						prompt_position = "top",
					},
					sorting_strategy = "ascending",
					winblend = 0,
				},
				pickers = {
					find_files = {
						theme = "dropdown",
					},
				},
			})

			-- Optional: load extensions
			require("telescope").load_extension("fzf")
		end,
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
			{
				"<leader>fa",
				function()
					require("telescope.builtin").find_files({
						hidden = true,
						no_ignore = true,
						follow = true,
					})
				end,
				desc = "Find all files (including .gitignore)",
			},
		},
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
}
