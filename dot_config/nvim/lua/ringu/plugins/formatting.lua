return {
  'stevearc/conform.nvim',
  config = function()
    local conform = require 'conform'

    conform.setup {
      formatters_by_ft = {
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        svelte = { 'prettier' },
        css = { 'prettier' },
        html = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },
        graphql = { 'prettier' },
        lua = { 'stylua' },
      },
      notify_on_error = true,
      log_level = vim.log.levels.DEBUG,
    }

    vim.keymap.set({ 'n', 'v' }, '<C-S-I>', function()
      conform.format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 3000,
      }
    end, { desc = 'Format file or range (in vusual mode)' })
  end,
}
