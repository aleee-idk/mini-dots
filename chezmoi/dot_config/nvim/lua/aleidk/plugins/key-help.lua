return {
	"echasnovski/mini.clue",
	version = "*",
	event = "VeryLazy",
	config = function()
		local miniclue = require("mini.clue")
		miniclue.setup({
			triggers = {
				-- Leader triggers
				{ mode = "n", keys = "<Leader>" },
				{ mode = "x", keys = "<Leader>" },

				-- Built-in completion
				{ mode = "i", keys = "<C-x>" },

				-- `g` key
				{ mode = "n", keys = "g" },
				{ mode = "x", keys = "g" },

				-- Marks
				{ mode = "n", keys = "'" },
				{ mode = "n", keys = "`" },
				{ mode = "x", keys = "'" },
				{ mode = "x", keys = "`" },

				-- Registers
				{ mode = "n", keys = '"' },
				{ mode = "x", keys = '"' },
				{ mode = "i", keys = "<C-r>" },
				{ mode = "c", keys = "<C-r>" },

				-- Window commands
				{ mode = "n", keys = "<C-w>" },

				-- `z` key
				{ mode = "n", keys = "z" },
				{ mode = "x", keys = "z" },
			},

			-- Add a "postkeys" value to activate those keys after others
			clues = {
				miniclue.gen_clues.builtin_completion(),
				miniclue.gen_clues.g(),
				miniclue.gen_clues.marks(),
				miniclue.gen_clues.registers(),
				miniclue.gen_clues.windows(),
				miniclue.gen_clues.z(),

				{ mode = "n", keys = "<Leader><Leader>",  desc = "+Bookmarks" },
				{ mode = "n", keys = "<Leader><Leader>n", postkeys = "<Leader><Leader>" },
				{ mode = "n", keys = "<Leader><Leader>N", postkeys = "<Leader><Leader>" },
				{ mode = "n", keys = "<Leader>b",         desc = "+Buffers" },
				{ mode = "n", keys = "<Leader>f",         desc = "+Find" },
				{ mode = "n", keys = "<Leader>g",         desc = "+Git" },
				{ mode = "n", keys = "<Leader>l",         desc = "+LSP" },
				{ mode = "n", keys = "<Leader>r",         desc = "+Replace" },
				{ mode = "n", keys = "<Leader>u",         desc = "+UI & Config" },
				{ mode = "n", keys = "<Leader>un",        desc = "+Noice" },
			},

			-- Clue window settings
			window = {
				-- Floating window config
				config = {
					width = "auto",
				},
				-- Delay before showing clue window
				delay = 200,
				-- Keys to scroll inside the clue window
				scroll_down = "<C-d>",
				scroll_up = "<C-u>",
			},
		})
	end,
}
