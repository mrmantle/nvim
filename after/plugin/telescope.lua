local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
vim.keymap.set('n', '<leader>gr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>gi', builtin.lsp_implementations, {})

require('telescope').setup {
  defaults = {
    layout_strategy = 'flex',
    layout_config = {
      flip_columns = 160,
      horizontal = {
        prompt_position = 'top',
        width = { padding = 0 },
        height = { padding = 0 }
      },
      vertical = {
        mirror = true,
        prompt_position = 'top',
        width = { padding = 0 },
        height = { padding = 0 }
      }
    },
    color_devicons = false,
    sorting_strategy = 'ascending'
  },
  extensions = {
    file_browser = {
      grouped = true,
      hidden = { file_browser = true, folder_browser = true },
      dir_icon = ' ',
      dir_icon_hl = 'Type',
      hijack_netrw = true
    }
  }
}

require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')
