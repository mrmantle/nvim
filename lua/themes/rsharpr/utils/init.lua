local M = {}

function M.highlighter(group, colours)
  colours.fg = colours.fg or { "none", "none" }
  colours.bg = colours.bg or { "none", "none" }
  local guifg = colours.fg[1]
  local ctermfg = colours.fg[2]
  local guibg = colours.bg[1]
  local ctermbg = colours.bg[2]
  local underline = colours.underline or false
  local bold = colours.bold or false
  local reverse = colours.reverse or false

  vim.api.nvim_set_hl(0, group, {
    fg = guifg,
    bg = guibg,
    ctermfg = ctermfg,
    ctermbg = ctermbg,
    underline = underline,
    bold = bold,
    reverse = reverse,
  })
end

return M
