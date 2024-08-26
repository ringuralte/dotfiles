return {
	"rmagatti/auto-session",
	config = function()
		vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
		require("auto-session").setup({
			log_level = "error",
			auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			auto_save_enabled = true,
			auto_restore_enabled = true,
			pre_save_cmds = { "NvimTreeClose" },
			save_extra_cmds = {
				"NvimTreeOpen",
			},
		})
	end,
}
