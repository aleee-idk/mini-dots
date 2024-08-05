return {
	"mfussenegger/nvim-lint",
	event = "VeryLazy",
	config = function()
		local lint = require("lint")

		lint.linters.gitlint.stdin = true
		lint.linters.gitlint.args = { "--contrib", "contrib-title-conventional-commits", "--msg-filename", "-" }

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			-- astro = { "eslint_d" },
			python = { "pylint" },
			sh = { "shellcheck" },
			NeogitCommitMessage = { "gitlint" },
			gitcommit = { "gitlint" },
			markdown = { "markdownlint" },
		}

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
