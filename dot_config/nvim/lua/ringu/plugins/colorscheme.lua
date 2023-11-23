return {
  -- also consider onedark and one dark pro nvim
  -- 'olimorris/onedarkpro.nvim',
  -- priority = 1000,
  -- config = function()
  --   require('onedarkpro').setup()
  --   vim.cmd [[colorscheme onedark_vivid]]
  -- end,
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup()
    vim.cmd [[colorscheme catppuccin-macchiato]]
  end,
}
