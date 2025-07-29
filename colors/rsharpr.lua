-- Nvim colour theme based off JetBrains resharper highlighting
local rsharpr = require('rsharpr.highlights')

-- Define the colours. Hex is used for the gui colours.
-- The second colour is the cterm colour which is used by the linux console.
local colours = {
  none = { 'none', 'none' },
  black = { '#000000', 0 },
  chineseBlack = { '#140027', 0 },
  cyan = { '#00ffff', 14 },
  darkCyan = { '#008b8b', 6 },
  darkPurple = { '#2b193c', 0 },
  darkSkyBlue = { '#569cd6', 12 },
  fawn = { '#dea678', 3 },
  frenchSkyBlue = { '#80a0ff', 12 },
  gainsboro = { '#dcdcdc', 7 },
  grey = { '#9b9b9b', 8 },
  imperialRed = { '#eb2d3a', 9 },
  jasmine = { '#ffd782', 11 },
  maastrichtBlue = { '#092236', 4 },
  magenta = { '#ff00ff', 5 },
  night = { '#2c3043', 4 },
  mango = { '#ffca4d', 11 },
  paleViolet = { '#be7cff', 5 },
  periwinkle = { '#c3ccdc', 7 },
  persianOrange = { '#d69056', 3 },
  purpleSky = { '#7c7cff', 12 },
  red = { '#ff3333', 9 },
  snow = { '#add8e6', 15 },
  snowIce = { '#45565c', 8 },
  sunny = { '#eeee82', 11 },
  tumbleweed = { '#d69d85', 3 },
  violet = { '#ee82ee', 13 },
  white = { '#ffffff', 15 },
  winter = { '#9cdcfe', 15 },
}

rsharpr.load_syntax(colours)
