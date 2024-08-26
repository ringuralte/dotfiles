return {
	"hrsh7th/nvim-cmp",
	-- event = "InsertEnter",
	dependencies = {
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-path", -- source for file system paths
		-- Snippet Engine & its associated nvim-cmp source
		-- {
		-- 	"L3MON4D3/LuaSnip",
		-- 	build = (function()
		-- 		-- Build Step is needed for regex support in snippets
		-- 		-- This step is not supported in many windows environments
		-- 		-- Remove the below condition to re-enable on windows
		-- 		if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
		-- 			return
		-- 		end
		-- 		return "make install_jsregexp"
		-- 	end)(),
		-- },
		-- "saadparwaiz1/cmp_luasnip",

		-- Adds LSP completion capabilities
		"hrsh7th/cmp-nvim-lsp",

		"hrsh7th/cmp-buffer",

		"hrsh7th/cmp-cmdline",

		-- Adds a number of user-friendly snippets
		"rafamadriz/friendly-snippets",
	},
	config = function()
		local cmp = require("cmp")
		-- local luasnip = require("luasnip")

		-- require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			snippet = {
				expand = function(args)
					-- luasnip.lsp_expand(args.body)
					vim.snippet.expand(args.body)
				end,
			},
			completion = { completeopt = "menu,menuone,noselect,noinsert" },
			mapping = cmp.mapping.preset.insert({
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = false,
				}),
				-- ["<Tab>"] = cmp.mapping(function(fallback)
				-- 	if cmp.visible() then
				-- 		cmp.select_next_item()
				-- 	elseif luasnip.expand_or_locally_jumpable() then
				-- 		luasnip.expand_or_jump()
				-- 	else
				-- 		fallback()
				-- 	end
				-- end, { "i", "s" }),
				-- ["<S-Tab>"] = cmp.mapping(function(fallback)
				-- 	if cmp.visible() then
				-- 		cmp.select_prev_item()
				-- 	elseif luasnip.locally_jumpable(-1) then
				-- 		luasnip.jump(-1)
				-- 	else
				-- 		fallback()
				-- 	end
				-- end, { "i", "s" }),
			}),
			sources = {
				{ name = "nvim_lsp" },
				{ name = "codeium" },
				{ name = "buffer" },
				{ name = "path" },
			},
			-- sources = cmp.config.sources({ -- will appear in order like below
			-- 	-- { name = "nvim_lsp" },
			-- 	-- { name = "codeium" },
			-- 	-- { name = "luasnip" }, -- snippets
			-- 	-- { name = "buffer" }, -- text within current buffer
			-- 	-- { name = "path" }, -- file system paths
			-- }),
			sorting = {
				comparators = {
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					cmp.config.compare.recently_used,
					require("clangd_extensions.cmp_scores"),
					cmp.config.compare.kind,
					cmp.config.compare.sort_text,
					cmp.config.compare.length,
					cmp.config.compare.order,
				},
			},
		})
	end,
}
