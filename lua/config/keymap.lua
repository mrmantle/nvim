vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Editing/Formatting
vim.keymap.set('v', 'J', "<cmd>m '>+1<CR>gv=gv", { desc = 'Move selection up one line and align' })
vim.keymap.set('v', 'K', "<cmd>m '<-2<CR>gv=gv", { desc = 'Move selection down one line and align' })
vim.keymap.set('n', 'cp', 'yap<S-}>p', { desc = 'Copy and paste paragraph' })
vim.keymap.set('n', '<leader>a', '=ip', { desc = 'Align inner paragraph' })
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d', { desc = 'Delete without saving to any register' })

-- Copy/Paste
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Yank into system clipboard register' })
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p', { desc = 'Put from system clipboard register' })
vim.keymap.set('x', '<leader>r', '"_dP', { desc = 'Replace text without overwriting register' })

-- Search/Replace
vim.keymap.set(
  'n',
  '<leader>u',
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = 'S[u]bstitute all word occurrences' }
)
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostics
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Op[e]n diagnostics' })
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump({ count = -1, float = true })
end, { desc = 'Go to previous [d]iagnostic' })
vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump({ count = 1, float = true })
end, { desc = 'Go to next [d]iagnostic' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Navigation
vim.keymap.set('n', '<C-H>', '<C-W>h')
vim.keymap.set('n', '<C-J>', '<C-W>j')
vim.keymap.set('n', '<C-K>', '<C-W>k')
vim.keymap.set('n', '<C-L>', '<C-W>l')
vim.keymap.set('n', '<C-X>', '<C-W>q')
vim.keymap.set('n', '<C-RIGHT>', '<cmd>vertical resize +2 <CR>', { silent = true })
vim.keymap.set('n', '<C-LEFT>', '<cmd>vertical resize -2 <CR>', { silent = true })
vim.keymap.set('n', '<C-DOWN>', '<cmd>resize -2 <CR>', { silent = true })
vim.keymap.set('n', '<C-UP>', '<cmd>resize +2 <CR>', { silent = true })
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Jump to next search match' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Jump to previous search match' })
vim.keymap.set('n', '<A-l>', '<cmd>bn<CR>', { desc = 'Buffer next', silent = true })
vim.keymap.set('n', '<A-h>', '<cmd>bp<CR>', { desc = 'Buffer previous', silent = true })
vim.keymap.set('n', '<A-x>', '<cmd>bd<CR>', { desc = 'Buffer close', silent = true })

-- Terminal
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<leader>vc', '<cmd>terminal<CR>', { desc = 'Open terminal' })

-- Remove default lsp keybindings
-- May look to slowly adopt these later
vim.keymap.del('n', 'gri')
vim.keymap.del('n', 'grr')
vim.keymap.del('x', 'gra')
vim.keymap.del('n', 'gra')
vim.keymap.del('n', 'grn')
