return {
  'nvim-telescope/telescope.nvim',
  version = '0.1.8',
  dependencies = {
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
  },
  config = function()
    local function dropdown_options()
      return {
        layout_config = {
          anchor = 'N',
          width = 0.6,
        },
        previewer = false,
      }
    end

    require('telescope').setup({
      defaults = {
        layout_strategy = 'flex',
        layout_config = {
          flex = { flip_columns = 150 },
          horizontal = {
            prompt_position = 'top',
            preview_width = 0.5,
          },
          vertical = {
            mirror = true,
            prompt_position = 'top',
          },
        },
        winblend = 12,
        color_devicons = false,
        sorting_strategy = 'ascending',
        path_display = { truncate = 3 },
        mappings = {
          i = {
            ['<C-o>'] = require('telescope.actions.layout').toggle_preview,
          },
          n = {
            ['o'] = require('telescope.actions.layout').toggle_preview,
          },
        },
      },
      extensions = {
        file_browser = {
          grouped = true,
          hidden = { file_browser = true, folder_browser = true },
          dir_icon = '',
          dir_icon_hl = 'Type',
          hijack_netrw = true,
          respect_gitignore = false,
        },
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(dropdown_options()),
        },
      },
    })

    require('telescope').load_extension('fzf')
    require('telescope').load_extension('file_browser')
    require('telescope').load_extension('ui-select')

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader>sm', builtin.marks, { desc = '[S]earch [M]arks' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set(
      'n',
      '<leader>se',
      '<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>',
      { desc = '[S]earch file [E]xplorer', silent = true }
    )

    vim.keymap.set('n', '<leader>/', function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown(dropdown_options()))
    end, { desc = '[/] Fuzzily search in current buffer' })

    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep({
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      })
    end, { desc = '[S]earch [/] in Open Files' })

    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files({ cwd = vim.fn.stdpath('config') })
    end, { desc = '[S]earch [N]eovim files' })
  end,
}
