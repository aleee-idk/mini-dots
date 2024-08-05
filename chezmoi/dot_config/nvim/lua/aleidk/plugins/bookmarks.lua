return {
	"cbochs/grapple.nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", lazy = true },
	},
	lazy = false,
	cmd = "Grapple",
	keys = {
		{ "<leader><leader>a", "<cmd>Grapple toggle<cr>", desc = "Toggle bookmark for current file" },
		{ "<leader><leader>t", "<cmd>Grapple toggle_tags<cr>", desc = "Toggle bookmarks window" },
		{ "<leader><leader>T", "<cmd>Grapple toggle_scopes<cr>", desc = "Toggle scopes window" },
		{ "<leader><leader>n", "<cmd>Grapple cycle forward<cr>", desc = "Next bookmark" },
		{ "<leader><leader>N", "<cmd>Grapple cycle backward<cr>", desc = "Prev bookmark" },
		{ "<leader><leader>j", "<cmd>Grapple select index=1<cr>", desc = "bookmark 1" },
		{ "<leader><leader>k", "<cmd>Grapple select index=2<cr>", desc = "bookmark 2" },
		{ "<leader><leader>l", "<cmd>Grapple select index=3<cr>", desc = "bookmark 3" },
		{ "<leader><leader>ñ", "<cmd>Grapple select index=4<cr>", desc = "bookmark 4" },
	},
}
