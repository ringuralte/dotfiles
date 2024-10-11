return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "auto",
				no_italic = true,
				-- transparent_background = true,
				dim_inactive = {
					transparent_background = true,
					enabled = true,
					shade = "dark",
					percentage = 0.15,
				},
			})
			vim.cmd([[colorscheme catppuccin]])
		end,
	},

	-- {
	-- 	"nyoom-engineering/oxocarbon.nvim",
	-- 	name = "oxocarbon",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd([[colorscheme oxocarbon]])
	-- 	end,
	-- },

	-- {
	-- 	"loctvl842/monokai-pro.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("monokai-pro").setup({
	-- 			styles = {
	-- 				comment = { italic = true },
	-- 				keyword = { italic = false }, -- any other keyword
	-- 				type = { italic = false }, -- (preferred) int, long, char, etc
	-- 				storageclass = { italic = false }, -- static, register, volatile, etc
	-- 				structure = { italic = false }, -- struct, union, enum, etc
	-- 				parameter = { italic = false }, -- parameter pass in function
	-- 				annotation = { italic = false },
	-- 				tag_attribute = { italic = false }, -- attribute of tag in reactjs
	-- 			},
	-- 			-- background_clear = {},
	-- 		})
	-- 		vim.cmd([[colorscheme monokai-pro-ristretto]])
	-- 	end,
	-- },

	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				-- transparent = true,
			})
			-- vim.cmd([[colorscheme kanagawa]])
		end,
	},

	-- {
	-- 	"Mofiqul/dracula.nvim",
	-- 	name = "dracula",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("dracula").setup()
	-- 		-- vim.cmd([[colorscheme dracula]])
	-- 	end,
	-- },

	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "auto",
				dark_variant = "main",
				dim_inactive_windows = true,

				styles = {
					italic = false,
				}
			})
			-- vim.cmd([[colorscheme rose-pine]])
		end,
	},

	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("tokyonight").setup({
	-- 			transparent = true,
	-- 		})
	-- 		-- vim.cmd([[colorscheme tokyonight]])
	-- 	end,
	-- },

	-- {
	-- 	"tiagovla/tokyodark.nvim",
	-- 	config = function()
	-- 		require("tokyodark").setup({
	-- 			transparent_background = true,
	-- 			styles = {
	-- 				comments = { italic = true }, -- style for comments
	-- 				keywords = { italic = false }, -- style for keywords
	-- 				identifiers = { italic = false }, -- style for identifiers
	-- 				functions = {}, -- style for functions
	-- 				variables = {}, -- style for variables
	-- 			},
	-- 		})
	-- 		-- vim.cmd([[colorscheme tokyodark]])
	-- 	end,
	-- },

	-- {
	-- 	"neanias/everforest-nvim",
	-- 	version = false,
	-- 	lazy = false,
	-- 	name = "everforest",
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	-- Optional; default configuration will be used if setup isn't called.
	-- 	config = function()
	-- 		require("everforest").setup({
	-- 			background = "hard",
	-- 			transparent_background_level = 2,
	-- 			dim_inactive_windows = true,
	-- 			float_style = "dim",
	-- 			-- Your config here
	-- 		})
	-- 		-- vim.cmd([[colorscheme everforest]])
	-- 	end,
	-- },

	-- {
	-- 	"olimorris/onedarkpro.nvim",
	-- 	priority = 1000, -- Ensure it loads first
	-- 	config = function()
	-- 		-- vim.cmd([[colorscheme onedark]])
	-- 	end,
	-- },
}
