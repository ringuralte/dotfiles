return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- Fuzzy Finder Algorithm which requires local dependencies to be built.
		-- Only load if `make` is available. Make sure you have the system
		-- requirements installed.
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			-- NOTE: If you are having trouble with this installation,
			--       refer to the README for telescope-fzf-native for more instructions.
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		local open_with_trouble = require("trouble.sources.telescope").open

		-- Use this to add more results without clearing the trouble list
		local add_to_trouble = require("trouble.sources.telescope").add

		telescope.setup({
			defaults = {
				file_ignore_patterns = {
					"node_modules",
					"gql",
					"package%-lock.json",
				},
				-- borderchars = { "█", " ", "▀", "█", "█", " ", " ", "▀" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-t>"] = open_with_trouble,
					},
					n = { ["<C-t>"] = open_with_trouble },
				},
				-- find_files = {
				-- 	hidden = true,
				-- },
			},
		})

		telescope.load_extension("fzf")
		-- telescope.load_extension("file_browser")

		local keymap = vim.keymap -- for conciseness

		local builtin = require("telescope.builtin")

		keymap.set("n", "<leader>?", builtin.oldfiles, { desc = "[?] Find recently opened files" })
		keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Search [G]it [F]iles" })
		-- keymap.set(
		-- 	"n",
		-- 	"<leader>sf",
		-- 	builtin.find_files({ find_command = { "rg", "--files", "--hidden", "-g", "!.git" } }),
		-- 	{ desc = "[S]earch [F]iles" }
		-- )
		vim.api.nvim_set_keymap(
			"n",
			"<leader>sf",
			":lua require('telescope.builtin').find_files({ find_command = { 'rg', '--files', '--hidden', '-g', '!.git' } })<CR>",
			{ noremap = true, silent = true }
		)
		-- map(
		-- 	"n",
		-- 	"<leader>sf",
		-- 	"<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
		-- 	default_opts
		-- )
		keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
		keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
		keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		keymap.set("n", "<leader>gh", function()
			builtin.lsp_definitions({ jump_type = "never" })
		end, { desc = "Display Definition" })
		keymap.set("n", "<leader><space>", builtin.buffers, { desc = "[ ] Find existing buffers" })
		keymap.set(
			"n",
			"<leader>/",
			require("telescope.builtin").current_buffer_fuzzy_find,
			{ desc = "[/] Fuzzily search in current buffer" }
		)
		keymap.set("n", "<leader>gr", builtin.lsp_references, { desc = "Find references" })
		keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Lsp definitions" })
	end,
}
