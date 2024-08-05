-- Move to windows with Ctrl and hjkl
-- Resize to windows with Alt and hjkl
-- Tmux aware
return {
	"mrjones2014/smart-splits.nvim",
	opts = { ignored_filetypes = { "nofile", "quickfix", "qf", "prompt" }, ignored_buftypes = { "nofile" } },
	keys = {
		{
			"<C-h>",
			function()
				require("smart-splits").move_cursor_left()
			end,
			desc = "Move to left window",
		},
		{
			"<C-j>",
			function()
				require("smart-splits").move_cursor_down()
			end,
			desc = "Move to bottom window",
		},
		{
			"<C-k>",
			function()
				require("smart-splits").move_cursor_up()
			end,
			desc = "Move to upper window",
		},
		{
			"<C-l>",
			function()
				require("smart-splits").move_cursor_right()
			end,
			desc = "Move to right window",
		},
		{
			"<A-h>",
			function()
				require("smart-splits").resize_left()
			end,
			desc = "Move to left window",
		},
		{
			"<A-j>",
			function()
				require("smart-splits").resize_down()
			end,
			desc = "Move to bottom window",
		},
		{
			"<A-k>",
			function()
				require("smart-splits").resize_up()
			end,
			desc = "Move to upper window",
		},
		{
			"<A-l>",
			function()
				require("smart-splits").resize_right()
			end,
			desc = "Move to right window",
		},
	},
}
