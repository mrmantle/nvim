local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<A-l>', vim.cmd.BufferNext, opts)
vim.keymap.set('n', '<A-h>', vim.cmd.BufferPrevious, opts)
vim.keymap.set('n', '<A-x>', vim.cmd.BufferClose, opts)

vim.keymap.set('n', '<A-1>', function() vim.cmd("BufferGoto 1") end, opts)
vim.keymap.set('n', '<A-2>', function() vim.cmd("BufferGoto 2") end, opts)
vim.keymap.set('n', '<A-3>', function() vim.cmd("BufferGoto 3") end, opts)
vim.keymap.set('n', '<A-4>', function() vim.cmd("BufferGoto 4") end, opts)
vim.keymap.set('n', '<A-5>', function() vim.cmd("BufferGoto 5") end, opts)
vim.keymap.set('n', '<A-6>', function() vim.cmd("BufferGoto 6") end, opts)
vim.keymap.set('n', '<A-7>', function() vim.cmd("BufferGoto 7") end, opts)
vim.keymap.set('n', '<A-8>', function() vim.cmd("BufferGoto 8") end, opts)
vim.keymap.set('n', '<A-9>', function() vim.cmd("BufferGoto 9") end, opts)

require('barbar').setup {
  animation = false,
  auto_hide = true,
  tabpages = true,
  closeable = true,
  clickable = true,
  icons = {
    filetype = {
      enabled = false
    },
    button = '',
    separator = {
      left = ''
    },
    modified = {
      button = '●'
    },
    pinned = {
      button = ''
    },
    inactive = {
      separator = {
        left = '' }
    }
  },
  maximum_padding = 0
}
