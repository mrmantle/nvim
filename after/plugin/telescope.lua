local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require('telescope').setup {
  defaults = {
    color_devicons = false
  },
  extensions = {
    file_browser = {
      grouped = true,
      hidden = { file_browser = true, folder_browser = true },
      dir_icon = " ",
      hijack_netrw = true
    }
  }
}

require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')
