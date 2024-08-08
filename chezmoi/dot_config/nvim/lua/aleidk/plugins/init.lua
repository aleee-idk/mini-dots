return {
	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{
		"mbbill/undotree",
		config = function()
			vim.g.undotree_WindowLayout = 2
			vim.g.undotree_ShortIndicators = 1
			vim.g.undotree_SetFocusWhenToggle = 1
		end,
		keys = {
			{ "<leader>fu", vim.cmd.UndotreeToggle, desc = "Undo tree" },
		},
	},
	{
		-- Highlight word under cursor
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		opts = { delay = 200 },
		config = function(_, opts)
			require("illuminate").configure(opts)
		end,
	},
	{
		-- Color Picker
		"uga-rosa/ccc.nvim",
		event = "VeryLazy",
		opts = {
			auto_enable = true,
			lsp = true,
		},
	},
}
