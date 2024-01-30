vim.g.mapleader = ' '

-- Editing/Formatting
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('n', 'cp', 'yap<S-}>p')
vim.keymap.set('n', '<leader>a', '=ip')
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d')
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)

-- Copy/Paste
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')
vim.keymap.set({ 'n', 'v' }, '<C-P>', '"+p')
vim.keymap.set('x', '<leader>p', '"_dP')

-- Search/Replace
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Diagnostics
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Navigation
vim.keymap.set('n', '<C-H>', '<C-W>h')
vim.keymap.set('n', '<C-J>', '<C-W>j')
vim.keymap.set('n', '<C-K>', '<C-W>k')
vim.keymap.set('n', '<C-L>', '<C-W>l')
vim.keymap.set('n', '<C-W>', '<C-W>q')
vim.keymap.set('n', '<C-RIGHT>', ':vertical resize +2 <CR>', { silent = true })
vim.keymap.set('n', '<C-LEFT>', ':vertical resize -2 <CR>', { silent = true })
vim.keymap.set('n', '<C-DOWN>', ':resize -2 <CR>', { silent = true })
vim.keymap.set('n', '<C-UP>', ':resize +2 <CR>', { silent = true })
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '<A-l>', ':bn<CR>', { silent = true })
vim.keymap.set('n', '<A-h>', ':bp<CR>', { silent = true })
vim.keymap.set('n', '<A-x>', ':bd<CR>', { silent = true })

-- Netrw
vim.keymap.set('n', '<leader>t', ':Rex<CR>', { silent = true })
