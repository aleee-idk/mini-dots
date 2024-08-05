return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
			on_attach = function(buffer)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, "<leader>g" .. l, r, { buffer = buffer, desc = desc })
				end

				-- stylua: ignore start
				map("n", "j", gs.next_hunk, "Next Hunk")
				map("n", "k", gs.prev_hunk, "Prev Hunk")
				map({ "n", "v" }, "s", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
				map({ "n", "v" }, "r", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
				map("n", "u", gs.undo_stage_hunk, "Undo Stage Hunk")
				map("n", "R", gs.reset_buffer, "Reset Buffer")
				map("n", "<TAB>", gs.preview_hunk, "Preview Hunk")
				map("n", "l", function() gs.blame_line({ full = true }) end, "Blame Line")
				map("n", "d", gs.diffthis, "Diff This")
			end,
		},
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",      -- required
			"nvim-telescope/telescope.nvim", -- optional
			"sindrets/diffview.nvim",     -- optional
		},
		config = true,
		opts = {
			disable_line_numbers = false,
			console_timeout = 8000,
			graph_style = "unicode",
			kind = "tab",
			ignored_settings = {
				"NeogitPushPopup--force",
				"NeogitPullPopup--rebase",
				"NeogitCommitPopup--allow-empty",
				"NeogitCommitPopup--reuse-message",
				"NeogitRevertPopup--no-edit",
			},
		},
		keys = {
			{
				"<leader>gg",
				function()
					require("neogit").open()
				end,
				desc = "Neogit",
			},
			{
				"<leader>gc",
				function()
					require("neogit").open({ "commit" })
				end,
				desc = "Commit",
			},
			{
				"<leader>gp",
				function()
					require("neogit").open({ "pull" })
				end,
				desc = "Pull",
			},
			{
				"<leader>gP",
				function()
					require("neogit").open({ "push" })
				end,
				desc = "Push",
			},
		},
	},
}
