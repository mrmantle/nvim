-- Lualine bubble theme
local colours = require("themes.colours")

local idx = 1
local colors = {
  cyan = colours.cyan[idx],
  black = colours.black[idx],
  white = colours.periwinkle[idx],
  red = colours.fieryRose[idx],
  violet = colours.violet[idx],
  grey = colours.grey[idx],
}

return {
  normal = {
    a = { fg = colors.black, bg = colors.violet, gui = "bold" },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white },
    x = { fg = colors.white, bg = colors.grey },
  },
  insert = { a = { fg = colors.black, bg = colors.white, gui = "bold" } },
  visual = { a = { fg = colors.black, bg = colors.cyan, gui = "bold" } },
  replace = { a = { fg = colors.black, bg = colors.red, gui = "bold" } },
}
