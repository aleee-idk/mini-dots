return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = { "TroubleToggle", "Trouble" },
	keys = {
		{ "<leader>fq", "<CMD>TroubleToggle<CR>", desc = "Toggle trouble" },
		{ "<leader>fd", "<CMD>TroubleToggle workspace_diagnostics<CR>", desc = "Find diagnostics" },
		{
			"<leader>fD",
			"<CMD>TroubleToggle document_diagnostics<CR>",
			desc = "Find diagnostics in workspace",
		},
	},
	config = function()
		require("trouble").setup({
			mode = "document_diagnostics",
			action_keys = {
				open_split = "s",
				open_vsplit = "v",
				open_tab = "t",
			},
		})
	end,
}
