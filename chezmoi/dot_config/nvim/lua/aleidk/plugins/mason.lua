return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
	build = ":MasonUpdate",
	opts = {
		ensure_installed = {
			"blue",
			"pylint",
			"eslint_d",
			"markdownlint",
			"nimlsp",
			"prettierd",
			"shellcheck",
			"stylua",
			"gofumpt",
			"golines",
			"goimports-reviser",
			"gopls"
		},
	},
}
