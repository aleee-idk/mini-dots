-- Fuzzy Finder (files, lsp, etc)
return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{
			-- Blazingly Fast Fuzzy Finder Algorithm for Telescope
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
	},
	config = function()
		local actions = require("telescope.actions")
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		local opts = {
			defaults = {
				prompt_prefix = " ",
				selection_caret = " ",
				layout_strategy = "vertical",
				layout_config = { vertical = { height = 0.99, mirror = true, prompt_position = "top" } },
				mappings = {
					i = {
						["<c-u>"] = actions.preview_scrolling_up,
						["<c-d>"] = actions.preview_scrolling_down,
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-s>"] = actions.file_vsplit,
						["<C-v>"] = actions.file_split,
						["<ESC>"] = actions.close,
						["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
						["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<c-t>"] = function(...)
							return require("trouble.providers.telescope").open_with_trouble(...)
						end,
						["<a-t>"] = function(...)
							return require("trouble.providers.telescope").open_selected_with_trouble(...)
						end,
					},
				},
			},
		}
		telescope.setup(opts)

		-- Enable telescope fzf native, if installed
		pcall(telescope.load_extension, "fzf")

		-- Find files
		vim.keymap.set(
			"n",
			"<leader>fe",
			":Telescope file_browser path=%:p:h select_buffer=true<CR>",
			{ desc = "File Explorer" }
		)
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
		vim.keymap.set("n", "<leader>fF", function()
			builtin.find_files({ hidden = true, no_ignore = true })
		end, { desc = "Find all files" })

		-- Search inside files
		vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find word under cursor" })
		vim.keymap.set("n", "<leader>fW", builtin.live_grep, { desc = "Find word (live grep)" })

		-- Help
		vim.keymap.set("n", "<leader>fc", builtin.command_history, { desc = "Find in commands history" })
		vim.keymap.set("n", "<leader>fC", builtin.commands, { desc = "Find a command" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })
		vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find Keymaps" })

		-- Git
		vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Change branch" })

		-- Diagnosticos
		-- Disabled, handle by trouble
		-- vim.keymap.set("n", "<leader>fD", function()
		-- 	builtin.diagnostics({ bufnr = 0 })
		-- end, { desc = "Find diagnostics (Telescope)" })
		-- vim.keymap.set("n", "<leader>fD", function()
		-- 	builtin.diagnostics({ bufnr = nil })
		-- end, { desc = "Find diagnostics in workspace (Telescope)" })
		-- vim.keymap.set("n", "<leader>fz", builtin.spell_suggest, { desc = "Find spell suggestion" })
	end,
}
