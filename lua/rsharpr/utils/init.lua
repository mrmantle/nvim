local M = {}

function M.highlighter(group, colours)
  colours.fg = colours.fg or { 'none', 'none' }
  colours.bg = colours.bg or { 'none', 'none' }
  local g_foreground = colours.fg[1]
  local c_foreground = colours.fg[2]
  local g_background = colours.bg[1]
  local c_background = colours.bg[2]
  vim.cmd(
    string.format(
      'hi %s guifg=%s guibg=%s ctermfg=%s ctermbg=%s',
      group,
      g_foreground,
      g_background,
      c_foreground,
      c_background
    )
  )
end

return M
