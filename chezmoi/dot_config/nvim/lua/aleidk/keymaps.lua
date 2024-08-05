-- [[ Basic Keymaps ]]

function MAP(mode, l, r, desc)
	vim.keymap.set(mode, l, r, { desc = desc, silent = true })
end

local function default(desc)
	return {
		silent = true,
		desc = desc,
	}
end

local function fixIndentation()
	local indent = 2
	vim.opt.tabstop = indent
	vim.opt.shiftwidth = indent
	vim.opt.softtabstop = indent

	vim.cmd("retab")
end

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- vim.keymap.set("n", "<C-s>", "<CMD>w<CR>", default("Keep cursor centered while junping"))

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "J", "mzJ`z", default("Keep cursor in column while joining lines"))

vim.keymap.set("n", "|", ":vs<CR>", default("Open vsplit"))
vim.keymap.set("n", "°", ":sp<CR>", default("Open split"))

vim.keymap.set("n", "<C-d>", "<C-d>zz", default("Keep cursor centered while junping"))
vim.keymap.set("n", "<C-u>", "<C-u>zz", default("Keep cursor centered while junping"))

vim.keymap.set("n", "n", "nzzzv", default("Keep cursor centered while searching"))
vim.keymap.set("n", "N", "Nzzzv", default("Keep cursor centered while searching"))

vim.keymap.set("n", "Q", "<nop>", {})

vim.keymap.set(
	"n",
	"<leader>rw",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	default("Search and replace current word")
)

-- vim.keymap.set("n", "<leader>rR", ":s/", default("Search and replace inline"))
-- vim.keymap.set("n", "<leader>rr", ":%s/", default("Search and replace globally"))
-- vim.keymap.set("v", "<leader>r", ":s/", default("Search and replace in selection"))

vim.keymap.set("v", "p", [["_dP]], default("Paste without lossing yanked text"))

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", default("Move selection down"))
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", default("Move selection up"))
vim.keymap.set("n", "<Leader>uI", fixIndentation, default("Fix indentation"))

vim.keymap.set("n", "<Leader>uh", ":nohl<CR>", default("Remove search highlight"))

vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", default("Exit insert mode on terminal"))

vim.keymap.set("n", "<leader>bc", "<Cmd>bd<CR>", default("Close buffer"))
vim.keymap.set("n", "<leader>bA", "<Cmd>bufdo bd<CR>", default("Close all buffers"))
