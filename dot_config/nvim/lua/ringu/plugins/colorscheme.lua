return {
	-- 'catppuccin/nvim',
	-- name = 'catppuccin',
	-- priority = 1000,
	-- config = function()
	--   require('catppuccin').setup()
	--   vim.cmd [[colorscheme catppuccin-macchiato]]
	-- end,
	"Mofiqul/dracula.nvim",
	name = "dracula",
	priority = 1000,
	config = function()
		require("dracula").setup()
		vim.cmd ([[colorscheme dracula]])
	end,
}
