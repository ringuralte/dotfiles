return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup()
			-- vim.cmd([[colorscheme catppuccin-macchiato]])
		end,
	},

	{
		"Mofiqul/dracula.nvim",
		name = "dracula",
		priority = 1000,
		config = function()
			require("dracula").setup()
			-- vim.cmd([[colorscheme dracula]])
		end,
	},

	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "moon",
				dark_variant = "moon",
			})
			-- vim.cmd([[colorscheme rose-pine]])
		end,
	},

	{
		"tiagovla/tokyodark.nvim",
		config = function()
			require("tokyodark").setup({
				transparent_background = true,
				styles = {
					comments = { italic = true }, -- style for comments
					keywords = { italic = false }, -- style for keywords
					identifiers = { italic = false }, -- style for identifiers
					functions = {}, -- style for functions
					variables = {}, -- style for variables
				},
			})
			-- vim.cmd([[colorscheme tokyodark]])
		end,
	},

	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		name = "everforest",
		priority = 1000, -- make sure to load this before all the other start plugins
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
			require("everforest").setup({
				background = "hard",
				transparent_background_level = 2,
				dim_inactive_windows = true,
				float_style = "dim",
				-- Your config here
			})
			vim.cmd([[colorscheme everforest]])
		end,
	},
}
