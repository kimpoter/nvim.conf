return {
	"ibhagwan/fzf-lua",
	dependencies = { "echasnovski/mini.icons" },
	opts = {},
	keys = {
		{ "<leader>ff", function() require("fzf-lua").files() end, desc = "Find files in cwd" },
		{ "<leader>fg", function() require("fzf-lua").live_grep() end, desc = "Grep in cwd" },
		{ "<leader>fbi", function() require("fzf-lua").builtin() end, desc = "List fzf builtin cmd" },
		{ "<leader>fh", function() require("fzf-lua").helptags() end, desc = "Find nvim docs" },
		{ "<leader>fk", function() require("fzf-lua").keymaps() end, desc = "Find keymaps" },
		{ "<leader>fw", function() require("fzf-lua").grep_cword() end, desc = "Grep exactly current word" },
		{ "<leader>fW", function() require("fzf-lua").grep_cWORD() end, desc = "Grep whole more bit current word" },
		{ "<leader>fd", function() require("fzf-lua").diagnostics_document() end, desc = "Find diagnostics" },
		{ "<leader><leader>", function() require("fzf-lua").buffers() end, desc = "Find buffers" },
		{ "<leader>/", function() require("fzf-lua").lgrep_curbuf() end, desc = "Grep curr buffer" },
	},
}
