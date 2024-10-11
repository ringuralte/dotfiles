return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		local keymap = vim.keymap
		keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "Harpoon add to list" })
		keymap.set("n", "<C-s>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon toggle quick menu" })

		keymap.set("n", "<leader>hcl", function() harpoon:list():clear() end, {desc = "Harpoon clear list"})

		keymap.set("n", "<leader>h", function()
			harpoon:list():select(1)
		end, { desc = "Harpoon list select 1st item" })
		keymap.set("n", "<leader>j", function()
			harpoon:list():select(2)
		end, { desc = "Harpoon list select 2nd item" })
		keymap.set("n", "<leader>k", function()
			harpoon:list():select(3)
		end, { desc = "Harpoon list select 3rd item" })
		keymap.set("n", "<leader>l", function()
			harpoon:list():select(4)
		end, { desc = "Harpoon list select 4th item" })
		keymap.set("n", "<leader>1", function()
			harpoon:list():replace_at(1)
		end, { desc = "Harpoon list replace 1st item" })
		keymap.set("n", "<leader>2", function()
			harpoon:list():replace_at(2)
		end, { desc = "Harpoon list replace 2nd item" })
		keymap.set("n", "<leader>3", function()
			harpoon:list():replace_at(3)
		end, { desc = "Harpoon list replace 3rd item" })
		keymap.set("n", "<leader>4", function()
			harpoon:list():replace_at(4)
		end, { desc = "Harpoon list replace 4th item" })
	end,
}
