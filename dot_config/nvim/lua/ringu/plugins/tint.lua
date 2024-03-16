return {
	-- "levouh/tint.nvim",
	-- config = function()
	-- 	require("tint").setup({
	-- 		saturation = 0.9,
	-- 	})
	-- end,
	"miversen33/sunglasses.nvim",
	config = function()
		require("sunglasses").setup({
			filter_percent = 0.25,
			filter_type = "SHADE",
		})
	end,
}
