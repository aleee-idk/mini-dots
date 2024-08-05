return {
	{
		"ckolkey/ts-node-action",
		dependencies = { "nvim-treesitter" },
		event = "VeryLazy",
		config = function()
			require("ts-node-action").setup({})

			vim.keymap.set({ "n" }, "<leader>lA", require("ts-node-action").node_action, { desc = "Node Action" })
		end,
	},
	{
		"Wansmer/treesj",
		cmd = { "TSJToggle" },
		keys = {
			{ "<leader>lm", "<CMD>TSJToggle<CR>", desc = "Toggle treesitter join" },
		},
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {
			use_default_keymaps = true,
		},
	},
}
