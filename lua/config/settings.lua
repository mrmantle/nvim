vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_keepdir = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0

vim.o.termguicolors = true
vim.o.background = 'dark'

vim.cmd('colorscheme rsharpr')
vim.cmd('syntax on')

vim.o.hlsearch = true
vim.o.nu = true
vim.o.relativenumber = true
vim.o.showmode = false
vim.o.completeopt = 'menu,menuone,noinsert,noselect'
vim.o.mouse = 'a'
vim.o.guicursor = 'a:ver25'

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.diagnostic.config({
  virtual_text = false,
  float = {
    source = true
  }
})

vim.api.nvim_set_hl(0, 'TabLine', { fg = '#ffffff', bg = '#2c3042', underline = false })
vim.api.nvim_create_autocmd("BufWritePre", { command = [[%s/\s\+$//e]] })
