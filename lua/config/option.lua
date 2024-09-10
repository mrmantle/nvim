vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.opt.shell = 'pwsh'

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.signcolumn = 'yes'
vim.opt.timeoutlen = 300
vim.opt.hlsearch = true
vim.opt.showmode = false
vim.opt.cursorline = true
vim.opt.mouse = 'a'
vim.opt.scrolloff = 10

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.diagnostic.config({
  virtual_text = false,
  float = {
    source = true,
  },
})

-- Colours
vim.cmd('colorscheme rsharpr')
vim.cmd('syntax on') -- Seems to trigger ftplugins so keep below vim.opt indents
vim.api.nvim_set_hl(0, 'TabLine', { fg = '#ffffff', bg = '#2c3042', underline = false })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#ee82ee', bold = true })

-- Autocommands
vim.api.nvim_create_autocmd('BufWritePre', {
  desc = 'Remove whitespace at the end of lines',
  group = vim.api.nvim_create_augroup('remove-whitespace', { clear = true }),
  command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('TermOpen', {
  desc = 'Automatically enter terminal mode when a terminal opens',
  group = vim.api.nvim_create_augroup('auto-terminal-mode', { clear = true }),
  command = 'startinsert',
})

vim.api.nvim_create_autocmd('VimLeave', {
  desc = 'Restore the cursor shape on exit',
  group = vim.api.nvim_create_augroup('restore-cursor', { clear = true }),
  callback = function()
    vim.opt.guicursor = 'a:ver25'
  end,
})
