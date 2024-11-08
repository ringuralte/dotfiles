return {
	"dmmulroy/tsc.nvim",
	config = function()
    local utils = require("tsc.utils")
		require("tsc").setup({
			auto_start_watch_mode = true,
			auto_close_qflist = false,
			use_trouble_qflist = true,
      bin_path = utils.find_tsc_bin(),
			flags = {
				watch = false,
        project = function()
          return utils.find_nearest_tsconfig()
        end,
			},
		})
	end,
}
