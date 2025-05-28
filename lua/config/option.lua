vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

vim.o.termguicolors = true
vim.o.shell = 'pwsh'

vim.o.background = 'dark'
vim.o.winborder = 'rounded'

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.o.listchars = 'tab:» ,trail:·,nbsp:␣'

vim.o.signcolumn = 'yes'
vim.o.timeoutlen = 300
vim.o.hlsearch = true
vim.o.showmode = false
vim.o.cursorline = true
vim.o.mouse = 'a'
vim.o.scrolloff = 5

vim.o.nu = true
vim.o.relativenumber = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.diagnostic.config({
  virtual_text = false,
  float = {
    source = true,
  },
})

-- Colours
vim.cmd('colorscheme rsharpr')
vim.cmd('syntax on') -- Seems to trigger ftplugins so keep below vim.o indents
vim.api.nvim_set_hl(0, 'TabLine', { fg = '#ffffff', bg = '#2c3042', underline = false })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#ee82ee', bold = true })
vim.api.nvim_set_hl(0, 'PmenuSel', { fg = '#000000', bg = '#ee82ee', reverse = false })

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
    vim.hl.on_yank()
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
    vim.o.guicursor = 'a:ver25'
  end,
})
