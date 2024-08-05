return {
	"goolord/alpha-nvim",
	lazy = false,
	opts = function()
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			"           ████            ███      █████ █████     ",
			"          ░░███           ░░░      ░░███ ░░███      ",
			"  ██████   ░███   ██████  ████   ███████  ░███ █████",
			" ░░░░░███  ░███  ███░░███░░███  ███░░███  ░███░░███ ",
			"  ███████  ░███ ░███████  ░███ ░███ ░███  ░██████░  ",
			" ███░░███  ░███ ░███░░░   ░███ ░███ ░███  ░███░░███ ",
			"░░████████ █████░░██████  █████░░████████ ████ █████",
			" ░░░░░░░░ ░░░░░  ░░░░░░  ░░░░░  ░░░░░░░░ ░░░░ ░░░░░ ",
		}
		dashboard.section.header.opts.hl = "DashboardHeader"

		dashboard.section.buttons.val = {
			dashboard.button("LDR f f", "  Find File  ", "<leader>ff"),
			dashboard.button("LDR LDR t", "  Bookmars", "<leader><leader>t"),
			dashboard.button("LDR g g", "  Git  ", "<leader>gg"),
		}

		dashboard.section.footer.val =
			{ " ", " ", " ", "Nvim loaded " .. require("lazy").stats().count .. " plugins " }
		dashboard.section.footer.opts.hl = "DashboardFooter"

		dashboard.config.layout[1].val = vim.fn.max({ 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) })
		dashboard.config.layout[3].val = 5
		dashboard.config.opts.noautocmd = true

		return dashboard.opts
	end,
}
