return {
	"braxtons12/blame_line.nvim",
	config = function()
		require("blame_line").enable()
		local keymap = vim.keymap

		keymap.set("n", "<leader>b", "<cmd>BlameLineToggle<CR>", { desc = "Toggle blame line" })
	end,
}
