return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"cbochs/grapple.nvim",
	},
	opts = function()
		local icons = require("aleidk.constants").icons

		local function diff_source()
			local gitsigns = vim.b.gitsigns_status_dict
			if gitsigns then
				return {
					added = gitsigns.added,
					modified = gitsigns.changed,
					removed = gitsigns.removed,
				}
			end
		end

		local function position_scrollbar(str)
			local sbar = { "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }

			local curr_line = vim.api.nvim_win_get_cursor(0)[1]
			local lines = vim.api.nvim_buf_line_count(0)
			local i = math.floor((curr_line - 1) / lines * #sbar) + 1
			return str .. " " .. sbar[i]
		end

		return {
			options = {
				theme = "auto",
				globalstatus = true,
				disabled_filetypes = { statusline = { "dashboard", "alpha" } },
				component_separators = "",
				section_separators = "",
			},
			sections = {
				lualine_a = {
					{
						"mode",
						padding = 0,
						fmt = function()
							return " "
						end,
					},
				},
				lualine_b = {},
				lualine_c = {
					{ "branch", icon = icons.git.branch },
					{
						"overseer",
					},
					{
						-- Macro recording status
						function()
							return require("noice").api.status.mode.get()
						end,
						cond = function()
							return package.loaded["noice"] and require("noice").api.status.mode.has()
						end,
					},
				},
				lualine_x = {
					{
						function()
							return require("grapple").statusline()
						end,
					},
				},
				lualine_y = {
					{ "searchcount" },
					{ "location" },
					{
						"progress",
						fmt = position_scrollbar,
						separator = " ",
						padding = 0,
					},
				},
				lualine_z = {},
			},
			winbar = {
				lualine_b = {
					{
						"filename",
						path = 1,
						symbols = {
							modified = " ●", -- Text to show when the buffer is modified
							alternate_file = "#", -- Text to show to identify the alternate file
							directory = "", -- Text to show when the buffer is a directory
						},
					},
				},
				lualine_y = {
					{
						"diff",
						symbols = {
							added = icons.git.added,
							modified = icons.git.modified,
							removed = icons.git.removed,
						},
						source = diff_source,
					},
					{
						"diagnostics",
						symbols = {
							error = icons.diagnostics.Error,
							warn = icons.diagnostics.Warn,
							info = icons.diagnostics.Info,
							hint = icons.diagnostics.Hint,
						},
					},
				},
			},
			inactive_winbar = {
				lualine_b = {
					{
						"filename",
						path = 1,
						symbols = {
							modified = " ●", -- Text to show when the buffer is modified
							alternate_file = "#", -- Text to show to identify the alternate file
							directory = "", -- Text to show when the buffer is a directory
						},
					},
				},
				lualine_y = {
					{
						"diff",
						symbols = {
							added = icons.git.added,
							modified = icons.git.modified,
							removed = icons.git.removed,
						},
						source = diff_source,
					},
					{
						"diagnostics",
						symbols = {
							error = icons.diagnostics.Error,
							warn = icons.diagnostics.Warn,
							info = icons.diagnostics.Info,
							hint = icons.diagnostics.Hint,
						},
					},
				},
			},
			extensions = {
				"neo-tree",
				"lazy",
				"fugitive",
				"fzf",
				"man",
				"mason",
				"nvim-tree",
				"quickfix",
				"symbols-outline",
				"trouble",
			},
		}
	end,
}
