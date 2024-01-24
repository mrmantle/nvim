vim.o.termguicolors = true
vim.o.background = 'dark'

vim.cmd([[colorscheme rsharpr]])
vim.cmd([[syntax on]])

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

vim.g.barbar_auto_setup = false

vim.diagnostic.config({
  virtual_text = false,
  float = {
    source = 'always'
  }
})

vim.api.nvim_create_autocmd("BufWritePre", { command = [[%s/\s\+$//e]] })
