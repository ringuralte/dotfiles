vim.g.mapleader = " " -- map space as leader

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

keymap.set("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

keymap.set("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Open lazygit" })

keymap.set("n", "<leader>b", "<cmd>ToggleBlameLine<CR>", { desc = "Toggle blame line" })
