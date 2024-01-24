require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'lua',
    'vim',
    'vimdoc',
    'query',
    'c_sharp',
    'css',
    'html',
    'markdown',
    'markdown_inline',
    'typescript'
  },
  sync_install = false,
  auto_install = false,
  ignore_install = {},
  modules = {},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  indent = {
    enable = true
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25,
    persist_queries = false,
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    }
  }
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>hi', vim.cmd.TSHighlightCapturesUnderCursor, opts)
