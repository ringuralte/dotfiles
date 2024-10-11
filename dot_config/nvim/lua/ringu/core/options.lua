local opt = vim.opt -- for conciseness

local is_wsl = vim.fn.has("wsl") == 1

-- line numbers
opt.relativenumber = true
opt.number = true

-- set highlight on search
opt.hlsearch = true
opt.incsearch = true

opt.scrolloff = 8

-- enable mouse mode
opt.mouse = "a"

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
opt.clipboard = "unnamedplus"

-- enable wrap
opt.wrap = true

-- long lines will break at word boundaries rather than at the last character that fits on the screen
opt.linebreak = true

-- enable breakpoint indent
opt.breakindent = true

-- disable swap file
opt.swapfile = false

opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
opt.ignorecase = true
opt.smartcase = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- opt.conceallevel = 0

opt.cursorline = true

opt.laststatus = 3

-- opt.list = true
-- Set listchars
-- opt.listchars = 'nbsp:␣,eol:↲,tab:»\\ ,extends:›,precedes:‹,trail:•'
-- opt.listchars = {
--   space = '.',  -- Show spaces as ␣
--   tab = '▸ ',   -- Show tabs as ▸ followed by a space
--   trail = '.',  -- Show trailing spaces as •
--   -- eol = '¬',    -- Show end of line as ¬
-- }

-- Set showbreak
opt.showbreak = "↳ "

-- Disable number column in visual mode
-- vim.cmd([[
--   augroup my_visuallistchars
--     autocmd!
--     autocmd CursorMoved * if mode() =~# "[vV\<C-v>]" | set list | else | set nolist | endif
--   augroup END
-- ]], false)

-- opt.updatetime = 250
-- opt.timeoutlen = 500

-- Set completeopt to have a better completion experience
-- opt.completeopt = 'menuone,noselect'

opt.termguicolors = true

opt.title = true

-- highlight on yank feature
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

vim.filetype.add({
	extension = {
		postcss = "css",
		pcss = "css",
		astro = "astro",
	},
})

-- WSL Clipboard support
-- if is_wsl then
-- 	-- This is NeoVim's recommended way to solve clipboard sharing if you use WSL
-- 	-- See: https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl
-- 	vim.g.clipboard = {
-- 		name = "WslClipboard",
-- 		copy = {
-- 			["+"] = "clip.exe",
-- 			["*"] = "clip.exe",
-- 		},
-- 		paste = {
-- 			["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
-- 			["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
-- 		},
-- 		cache_enabled = 0,
-- 	}
-- end
