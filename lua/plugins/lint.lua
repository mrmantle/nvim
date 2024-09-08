return {
  'mfussenegger/nvim-lint',
  events = { 'BufWritePost', 'BufReadPost', 'InsertLeave' },
  config = function()
    local lint = require('lint')

    lint.linters_by_ft = {
      typescript = { 'eslint_d' },
    }

    vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
      group = vim.api.nvim_create_augroup('nvim-lint', { clear = true }),
      callback = function()
        require('lint').try_lint()
      end,
    })
  end,
}
