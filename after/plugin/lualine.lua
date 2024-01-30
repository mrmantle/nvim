require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'nightfly'
  },
  sections = {
    lualine_c = {
      {
        'buffers',
        buffers_color = {
          active = 'lualineActiveBuffer'
        }
      }
    }
  }
}
