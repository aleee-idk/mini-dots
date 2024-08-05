return {
	"folke/todo-comments.nvim",
	cmd = { "TodoTrouble", "TodoTelescope" },
	event = { "BufReadPost", "BufNewFile" },
	config = true,
    -- stylua: ignore
    keys = {
        { "]t",         function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
        { "[t",         function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
        { "<leader>ft", "<cmd>TodoTrouble<cr>",                              desc = "Find todos (Trouble)" },
        { "<leader>fT", "<cmd>TodoTelescope<cr>",                            desc = "Find todos (Telescope)" },
    },
}
