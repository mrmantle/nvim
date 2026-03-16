-- Nvim colour theme based on the JetBrains resharper colour scheme
local rsharpr = require("themes.rsharpr.highlights")
local colours = require("themes.colours")

rsharpr.load_syntax(colours)
