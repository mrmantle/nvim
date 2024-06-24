return require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim' }
  use { 'nvim-treesitter/playground' }
  use { 'neovim/nvim-lspconfig' }
  use { 'nvimtools/none-ls.nvim' }
  use { 'hoob3rt/lualine.nvim' }
  use { 'tpope/vim-fugitive' }
  use { 'lewis6991/gitsigns.nvim' }
  use { 'theHamsta/nvim-dap-virtual-text' }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  }
  use {
    'rcarriga/nvim-dap-ui',
    requires = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' }
  }
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end
  })
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-path"
    }
  }
end)
