return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	keys = { { "<leader>um", "<cmd>Mason<cr>", desc = "Mason" } },
	build = ":MasonUpdate",
}
