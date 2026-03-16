local M = {}
local cmd = vim.cmd
local g = vim.g
local fn = vim.fn
local utils = require("themes.rsharpr.utils")

cmd("hi clear")

if fn.exists("syntax_on") then
  cmd("syntax reset")
end

g.colors_name = "rsharpr"

function M.load_syntax(colours)
  local syntax = {}

  syntax["Boolean"] = { fg = colours.azul }
  syntax["Bracket"] = { fg = colours.periwinkle }
  syntax["Character"] = { fg = colours.gainsboro }
  syntax["Comment"] = { fg = colours.darkCyan }
  syntax["Conditional"] = { fg = colours.azul }
  syntax["Constant"] = { fg = colours.violet }
  syntax["CurSearch"] = { fg = colours.maastrichtBlue, bg = colours.drover }
  syntax["CursorLine"] = { bg = colours.black }
  syntax["CursorLineNr"] = { fg = colours.black, bg = colours.snow, bold = true }
  syntax["Debug"] = { fg = colours.drover }
  syntax["Define"] = { fg = colours.snow }
  syntax["Delimiter"] = { fg = colours.gainsboro }
  syntax["Directory"] = { fg = colours.azul }
  syntax["EndOfBuffer"] = { fg = colours.black }
  syntax["Error"] = { fg = colours.fieryRose, bg = colours.black }
  syntax["ErrorMsg"] = { fg = colours.fieryRose }
  syntax["Exception"] = { fg = colours.fieryRose }
  syntax["Float"] = { fg = colours.snow }
  syntax["FloatBorder"] = { bg = colours.matteBlack, fg = colours.snow }
  syntax["Function"] = { fg = colours.cyan }
  syntax["Identifier"] = { fg = colours.azul }
  syntax["Ignore"] = { fg = colours.black }
  syntax["Include"] = { fg = colours.snow }
  syntax["Keyword"] = { fg = colours.azul }
  syntax["Label"] = { fg = colours.snow }
  syntax["LineNR"] = { fg = colours.snow }
  syntax["Macro"] = { fg = colours.vividLavender }
  syntax["Normal"] = { fg = colours.gainsboro }
  syntax["NormalFloat"] = { fg = colours.gainsboro, bg = colours.matteBlack }
  syntax["Number"] = { fg = colours.snow }
  syntax["Numeric"] = { fg = colours.snow }
  syntax["Operator"] = { fg = colours.periwinkle }
  syntax["Pmenu"] = { fg = colours.gainsboro, bg = colours.matteBlack }
  syntax["PmenuSbar"] = { fg = colours.none, bg = colours.matteBlack }
  syntax["PmenuSel"] = { fg = colours.gainsboro, bg = colours.night, reverse = false }
  syntax["PreCondit"] = { fg = colours.gainsboro }
  syntax["PreProc"] = { fg = colours.gainsboro }
  syntax["Repeat"] = { fg = colours.azul }
  syntax["Search"] = { fg = colours.black, bg = colours.drover }
  syntax["SignColumn"] = { fg = colours.none, bg = colours.black }
  syntax["Special"] = { fg = colours.violet }
  syntax["SpecialChar"] = { fg = colours.violet }
  syntax["SpecialComment"] = { fg = colours.violet }
  syntax["Statement"] = { fg = colours.snow }
  syntax["StatusLine"] = { fg = colours.black, bg = colours.black }
  syntax["StorageClass"] = { fg = colours.snow }
  syntax["String"] = { fg = colours.tumbleweed }
  syntax["Structure"] = { fg = colours.snow }
  syntax["TabLine"] = { fg = colours.white, bg = colours.matteBlack, underline = false }
  syntax["TabLineFill"] = { fg = colours.matteBlack, bg = colours.matteBlack }
  syntax["TabLineSel"] = { fg = colours.white, bg = colours.purpleSky }
  syntax["Tag"] = { fg = colours.azul }
  syntax["Title"] = { fg = colours.vividLavender }
  syntax["Todo"] = { fg = colours.fieryRose }
  syntax["Type"] = { fg = colours.snow }
  syntax["Typedef"] = { fg = colours.snow }
  syntax["Visual"] = { bg = colours.night }
  syntax["WinSeparator"] = { fg = colours.snow }

  --Nvim--
  syntax["NvimCurly"] = syntax["Bracket"]
  syntax["NvimParenthesis"] = syntax["Bracket"]

  --C--
  syntax["cBracket"] = syntax["Bracket"]
  syntax["cParen"] = syntax["Bracket"]
  syntax["cTSPunctBracket"] = syntax["Bracket"]
  syntax["cInclude"] = syntax["Include"]
  syntax["cTSInclude"] = syntax["Include"]
  syntax["cType"] = syntax["Type"]
  syntax["cTSType"] = syntax["Type"]
  syntax["cConstant"] = syntax["Constant"]

  --Lua--
  syntax["luaParen"] = syntax["Bracket"]
  syntax["luaBlock"] = syntax["Bracket"]
  syntax["luaFunc"] = syntax["Function"]
  syntax["luaFunction"] = syntax["Function"]
  syntax["luaTable"] = syntax["Bracket"]
  syntax["luaTSPunctBracket"] = syntax["Bracket"]

  --Markdown--
  syntax["@punctuation.special"] = syntax["Label"]
  syntax["@markup.heading"] = syntax["Title"]
  syntax["@markup.link"] = syntax["Normal"]
  syntax["@markup.link.label"] = syntax["Identifier"]
  syntax["@markup.link.url"] = { fg = colours.frenchSkyBlue }
  syntax["@markup.list"] = { fg = colours.violet }
  syntax["@markup.raw"] = { fg = colours.purpleSky }
  syntax["@markup.quote"] = { fg = colours.winter }
  syntax["@markup.strong"] = { fg = colours.drover }
  syntax["@markup.italic"] = { fg = colours.cyan }

  --Treesitter--
  syntax["@field"] = { fg = colours.azul }
  syntax["@variable"] = { fg = colours.winter }
  syntax["@function.macro"] = syntax["Macro"]
  syntax["@function.builtin"] = syntax["Function"]
  syntax["@function.call"] = syntax["Function"]
  syntax["@constant.builtin"] = syntax["Constant"]
  syntax["@type.builtin"] = syntax["Keyword"]
  syntax["@boolean"] = syntax["Boolean"]
  syntax["@punctuation.bracket"] = syntax["Bracket"]

  --Lualine--
  syntax["LualineDiffAdd"] = { fg = colours.azul, bg = colours.grey }

  --Netrw--
  syntax["netrwGray"] = { bg = colours.matteBlack }
  syntax["Folded"] = { bg = colours.night }
  syntax["FoldColumn"] = { bg = colours.night }

  --Lsp--
  syntax["@lsp.type.variable"] = { fg = colours.winter }
  syntax["@lsp.type.namespace"] = syntax["Identifier"]
  syntax["@lsp.type.macro"] = syntax["Macro"]
  syntax["LspCodeLens"] = { fg = colours.snowIce }
  syntax["LspInlayHint"] = syntax["LspCodeLens"]

  --Html--
  syntax["@tag"] = syntax["Tag"]
  syntax["@tag.attribute"] = { fg = colours.violet }

  --HtmlAngular--
  syntax["htmlTag"] = { fg = colours.violet }
  syntax["htmlEndTag"] = { fg = colours.violet }
  syntax["htmlTagN"] = syntax["Tag"]
  syntax["htmlTagName"] = syntax["Tag"]

  --Telescope--
  syntax["TelescopeBorder"] = { bg = colours.matteBlack, fg = colours.snow }
  syntax["TelescopePromptCounter"] = { fg = colours.snow }
  syntax["TelescopeSelection"] = { bg = colours.night }
  syntax["TelescopeNormal"] = { fg = colours.gainsboro, bg = colours.matteBlack }
  syntax["TelescopeMatching"] = { fg = colours.drover }
  syntax["TelescopePreviewExecute"] = { fg = colours.violet }
  syntax["TelescopePreviewSize"] = { fg = colours.winter }
  syntax["TelescopePromptPrefix"] = { fg = colours.snow }

  --Quickfix--
  syntax["QuickFixLine"] = { fg = colours.black, bg = colours.violet }

  --Diff--
  syntax["DiffAdd"] = { fg = colours.azul, bg = colours.night }
  syntax["DiffChange"] = { fg = colours.jasmine, bg = colours.night }
  syntax["DiffDelete"] = { fg = colours.fieryRose, bg = colours.night }
  syntax["DiffText"] = { bg = colours.night }

  --Git--
  syntax["Added"] = { fg = colours.azul }
  syntax["Changed"] = { fg = colours.jasmine }
  syntax["Removed"] = { fg = colours.fieryRose }

  --Zsh--
  syntax["zshVariable"] = { fg = colours.azul }
  syntax["zshVariableDef"] = syntax["zshVariable"]
  syntax["zshFunction"] = syntax["Function"]

  --Rust--
  syntax["@RustFieldExpression"] = { fg = colours.violet }

  --Ibl--
  syntax["IblIndent"] = { fg = colours.darkPurple }
  syntax["IblScope"] = { fg = colours.purpleSky }

  --Dap--
  syntax["DapUINormal"] = { fg = colours.periwinkle }
  syntax["DapUIVariable"] = { fg = colours.periwinkle }
  syntax["DapUIScope"] = { fg = colours.frenchSkyBlue }
  syntax["DapUIType"] = { fg = colours.periwinkle }
  syntax["DapUIValue"] = { fg = colours.periwinkle }
  syntax["DapUIModifiedValue"] = { fg = colours.periwinkle }
  syntax["DapUIDecoration"] = { fg = colours.periwinkle }
  syntax["DapUIThread"] = { fg = colours.frenchSkyBlue }
  syntax["DapUIStoppedThread"] = { fg = colours.periwinkle }
  syntax["DapUIFrameName"] = { fg = colours.periwinkle }
  syntax["DapUISource"] = { fg = colours.periwinkle }
  syntax["DapUILineNumber"] = { fg = colours.snow }
  syntax["DapUIFloatBorder"] = { fg = colours.periwinkle }
  syntax["DapUIWatchesValue"] = { fg = colours.frenchSkyBlue }
  syntax["DapUIWatchesEmpty"] = { fg = colours.periwinkle }
  syntax["DapUIWatchesError"] = { fg = colours.fieryRose }
  syntax["DapUIBreakpointsPath"] = { fg = colours.frenchSkyBlue }
  syntax["DapUIBreakpointsInfo"] = { fg = colours.periwinkle }
  syntax["DapUIBreakpointsCurrentLine"] = { fg = colours.periwinkle }
  syntax["DapUIBreakpointsLine"] = { fg = colours.periwinkle }
  syntax["DapUIBreakpointsDisabledLine"] = { fg = colours.periwinkle }
  syntax["DapUICurrentFrameName"] = { fg = colours.frenchSkyBlue }
  syntax["DapUIStepOver"] = { fg = colours.periwinkle }
  syntax["DapUIStepInto"] = { fg = colours.periwinkle }
  syntax["DapUIStepBack"] = { fg = colours.periwinkle }
  syntax["DapUIStepOut"] = { fg = colours.periwinkle }
  syntax["DapUIStop"] = { fg = colours.periwinkle }
  syntax["DapUIPlayPause"] = { fg = colours.periwinkle }
  syntax["DapUIRestart"] = { fg = colours.periwinkle }
  syntax["DapUIUnavailable"] = { fg = colours.night }
  syntax["DapUIWinSelect"] = { fg = colours.periwinkle }
  syntax["DapUIPlayPauseNC"] = { fg = colours.periwinkle }
  syntax["DapUIRestartNC"] = { fg = colours.periwinkle }
  syntax["DapUIStopNC"] = { fg = colours.periwinkle }
  syntax["DapUIUnavailableNC"] = { fg = colours.night }
  syntax["DapUIStepOverNC"] = { fg = colours.periwinkle }
  syntax["DapUIStepIntoNC"] = { fg = colours.periwinkle }
  syntax["DapUIStepBackNC"] = { fg = colours.periwinkle }
  syntax["DapUIStepOutNC"] = { fg = colours.periwinkle }

  --Blink--
  syntax["BlinkCmpMenuBorder"] = syntax["FloatBorder"]
  syntax["BlinkCmpScrollBarThumb"] = { bg = colours.winter }

  for group, highlights in pairs(syntax) do
    utils.highlighter(group, highlights)
  end
end

return M
