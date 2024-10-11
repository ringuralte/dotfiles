return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Automatically install LSPs to stdpath for neovim
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",

		-- Useful status updates for LSP
		-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
		{ "j-hui/fidget.nvim", tag = "legacy", opts = {} },
		"hrsh7th/cmp-nvim-lsp",
		-- { "antosha417/nvim-lsp-file-operations", config = true }, -- using a separate config for this

		"folke/neodev.nvim",
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		local opts = { noremap = true, silent = true }
		local on_attach = function(_, bufnr)
			opts.buffer = bufnr

			-- set keybinds
			-- opts.desc = "Show LSP references"
			-- keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

			-- opts.desc = "Go to declaration"
			-- keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

			-- opts.desc = "Show LSP definitions"
			-- keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

			-- opts.desc = "Show LSP implementations"
			-- keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

			-- opts.desc = "Show LSP type definitions"
			-- keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

			-- opts.desc = "Show buffer diagnostics"
			-- keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

			-- opts.desc = "Go to previous diagnostic"
			-- keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

			-- opts.desc = "Go to next diagnostic"
			-- keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
		end

		local default_caps = {
			workspace = {
				didChangeWatchedFiles = {
					dynamicRegistration = true,
				},
			},
		}

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = vim.tbl_deep_extend("keep", default_caps, cmp_nvim_lsp.default_capabilities())

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		lspconfig["clangd"].setup({
			capabilities = {
				cmp_nvim_lsp.default_capabilities(),
				offsetEncoding = { "utf-16" },
			},
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
				require("clangd_extensions.inlay_hints").setup_autocmd()
				require("clangd_extensions.inlay_hints").set_inlay_hints()
			end,
			cmd = {
				"clangd",
				"--background-index",
				"--clang-tidy",
				"--header-insertion=iwyu",
				"--completion-style=detailed",
				"--function-arg-placeholders",
				"--fallback-style=llvm",
			},
			init_options = {
				usePlaceholders = true,
				completeUnimported = true,
				clangdFileStatus = true,
			},
			root_dir = function(fname)
				return require("lspconfig.util").root_pattern(
					"Makefile",
					"configure.ac",
					"configure.in",
					"config.h.in",
					"meson.build",
					"meson_options.txt",
					"build.ninja"
				)(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
					fname
				) or require("lspconfig.util").find_git_ancestor(fname)
			end,
		})

		-- configure html server
		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure typos lsp
		lspconfig["typos_lsp"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["phpactor"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		-- lspconfig["vtsls"].setup({
		-- 	capabilities = capabilities,
		-- 	on_attach = on_attach,
		-- 	filetypes = {
		-- 		"javascript",
		-- 		"javascriptreact",
		-- 		"javascript.jsx",
		-- 		"typescript",
		-- 		"typescriptreact",
		-- 		"typescript.tsx",
		-- 		"astro",
		-- 	},
		-- 	settings = {
		-- 		typescript = {
		-- 			inlayHints = {
		-- 				parameterNames = { enabled = "literals" },
		-- 				parameterTypes = { enabled = true },
		-- 				variableTypes = { enabled = true },
		-- 				propertyDeclarationTypes = { enabled = true },
		-- 				functionLikeReturnTypes = { enabled = true },
		-- 				enumMemberValues = { enabled = true },
		-- 			},
		-- 		},
		-- 	},
		-- })

		-- lspconfig["tsserver"].setup({
		-- 	capabilities = capabilities,
		-- 	on_attach = on_attach,
		-- 	filetypes = {
		-- 		"javascript",
		-- 		"javascriptreact",
		-- 		"javascript.jsx",
		-- 		"typescript",
		-- 		"typescriptreact",
		-- 		"typescript.tsx",
		-- 	},
		-- })

		-- configure astro
		lspconfig["astro"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			init_options = {
				typescript = {
					tsdk = "./node_modules/typescript/lib",
				},
			},
		})

		-- configure css server
		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure tailwindcss server
		lspconfig["tailwindcss"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure svelte server
		lspconfig["svelte"].setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)

				vim.api.nvim_create_autocmd("BufWritePost", {
					pattern = { "*.js", "*.ts" },
					callback = function(ctx)
						if client.name == "svelte" then
							client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
						end
					end,
				})
			end,
		})

		-- configure prisma orm server
		-- lspconfig["prismals"].setup({
		-- 	capabilities = capabilities,
		-- 	on_attach = on_attach,
		-- })

		-- configure graphql language server
		lspconfig["graphql"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = {
				"graphql",
				"gql",
				"svelte",
				"typescriptreact",
				"javascriptreact",
				"typescript",
				"javascript",
				"astro",
			},
		})

		-- configure emmet language server
		lspconfig["emmet_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = {
				"html",
				"typescriptreact",
				"javascriptreact",
				"css",
				"sass",
				"scss",
				"less",
				"svelte",
				"astro",
			},
		})

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}
