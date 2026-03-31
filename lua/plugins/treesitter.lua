return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/playground",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "css",
        "c_sharp",
        "html",
        "json",
        "jsonc",
        "kdl",
        "lua",
        "markdown",
        "markdown_inline",
        "query",
        "sql",
        "typescript",
        "vim",
        "vimdoc",
      },
      sync_install = false,
      auto_install = false,
      ignore_install = {},
      modules = {},
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
    })
  end,
}
