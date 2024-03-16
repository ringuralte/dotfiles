return {
	"nvimdev/lspsaga.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},
	config = function()
		require("lspsaga").setup({
			lightbulb = {
				enable = false, -- disables both
				-- virtual_text = false, -- disables just the one at the end of the line
			},
		})

		local keymap = vim.keymap

		keymap.set("n", "<leader>fr", "<cmd>Lspsaga finder<CR>", { desc = "Find references and implementation" })
	end,
}
