return {
	"ibhagwan/fzf-lua",
	dependencies = { "echasnovski/mini.icons" },
	opts = {},
	keys = {
		{ "<leader>ff", function() require("fzf-lua").files() end, desc = "Find files in cwd" },
		{ "<leader>fg", function() require("fzf-lua").live_grep() end, desc = "Grep in cwd" },
		{ "<leader>fbi", function() require("fzf-lua").builtin() end, desc = "List fzf builtin cmd" },
	},
}
