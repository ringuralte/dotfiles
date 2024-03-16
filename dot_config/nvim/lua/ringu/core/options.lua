local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true
opt.number = true

-- set highlight on search
opt.hlsearch = true
opt.incsearch = true

opt.scrolloff = 8

-- enable mouse mode
opt.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
opt.clipboard = 'unnamedplus'

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

opt.list = true
-- Set listchars
-- opt.listchars = 'nbsp:␣,eol:↲,tab:»\\ ,extends:›,precedes:‹,trail:•'
opt.listchars = {
  space = '.',  -- Show spaces as ␣
  tab = '▸ ',   -- Show tabs as ▸ followed by a space
  trail = '.',  -- Show trailing spaces as •
  eol = '¬',    -- Show end of line as ¬
}


-- Set showbreak
opt.showbreak = '↳ '

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
opt.completeopt = 'menuone,noselect'

opt.termguicolors = true

opt.wrap = false

opt.title = true

-- highlight on yank feature
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.filetype.add({
  extension = {
    postcss = 'css',
    pcss = 'css',
    astro = 'astro'
  }
})
