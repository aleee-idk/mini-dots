return { -- Change colors.none if not using a transparent background
	"catppuccin/nvim",
	priority = 1000,
	lazy = false,
	opts = {
		flavour = "macchiato",
		transparent_background = true,
		integrations = {
			cmp = true,
			notify = true,
			harpoon = false,
			mason = true,
			neogit = true,
			noice = true,
			hop = true,
			lsp_trouble = true,
			indent_blankline = {
				enabled = true,
			},
		},
		custom_highlights = function(colors)
			return {
				-- Fix colors for cmp
				Pmenu = { bg = colors.none, blend = 0 },
				FloatBorder = { bg = colors.none },
				CmpItemMenu = { fg = colors.text, bg = colors.none },
				-- dadbod-ui
				NotificationInfo = { bg = colors.none, fg = colors.text },
				NotificationWarning = { bg = colors.none, fg = colors.yellow },
				NotificationError = { bg = colors.none, fg = colors.red },
			}
		end,
	},

	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}
