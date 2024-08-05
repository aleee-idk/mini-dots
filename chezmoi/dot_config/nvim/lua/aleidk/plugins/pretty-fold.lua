return {
	"anuvyklack/pretty-fold.nvim",
	opts = {
		sections = {
			left = {
				"+",
				function()
					return string.rep("-", vim.v.foldlevel)
				end,
				" ",
				"content",
				" ",
				"number_of_folded_lines",
				" ",
				function()
					return string.rep("-", vim.v.foldlevel)
				end,
				"+",
			},
		},
		fill_char = " ",

		-- Possible values:
		-- "delete" : Delete all comment signs from the fold string.
		-- "spaces" : Replace all comment signs with equal number of spaces.
		-- false    : Do nothing with comment signs.
		process_comment_signs = "delete",

		-- List of patterns that will be removed from content foldtext section.
		stop_words = {
			"@brief%s*", -- (for C++) Remove '@brief' and all spaces after.
		},

		matchup_patterns = {
			{ "{", "}" },
			{ "%(", ")" }, -- % to escape lua pattern char
			{ "%[", "]" }, -- % to escape lua pattern char
		},

		ft_ignore = { "neorg" },
	},
}
