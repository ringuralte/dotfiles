return {
	"dmmulroy/tsc.nvim",
	config = function()
		require("tsc").setup({
			auto_start_watch_mode = false,
			auto_focus_qflist = false,
			auto_close_qflist = true,
			flags = {
				watch = true,
			},
		})
	end,
}
