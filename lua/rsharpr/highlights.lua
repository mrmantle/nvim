local M = {}
local cmd = vim.cmd
local g = vim.g
local fn = vim.fn
local utils = require('rsharpr.utils')

cmd('hi clear')

if fn.exists('syntax_on') then
  cmd('syntax reset')
end

g.colors_name = 'rsharpr'

function M.load_syntax(colours)
  local syntax = {}

  syntax['Boolean'] = { fg = colours.darkSkyBlue }
  syntax['Bracket'] = { fg = colours.periwinkle }
  syntax['Character'] = { fg = colours.gainsboro }
  syntax['Comment'] = { fg = colours.darkCyan }
  syntax['Conditional'] = { fg = colours.darkSkyBlue }
  syntax['Constant'] = { fg = colours.violet }
  syntax['CursorLine'] = { bg = colours.darkPurple }
  syntax['Debug'] = { fg = colours.mango }
  syntax['Define'] = { fg = colours.snow }
  syntax['Delimiter'] = { fg = colours.gainsboro }
  syntax['Directory'] = { fg = colours.darkSkyBlue }
  syntax['EndOfBuffer'] = { fg = colours.black }
  syntax['Error'] = { fg = colours.imperialRed, bg = colours.black }
  syntax['ErrorMsg'] = { fg = colours.imperialRed }
  syntax['Exception'] = { fg = colours.imperialRed }
  syntax['Float'] = { fg = colours.snow }
  syntax['FloatBorder'] = { bg = colours.night, fg = colours.snow }
  syntax['Function'] = { fg = colours.cyan }
  syntax['Identifier'] = { fg = colours.darkSkyBlue }
  syntax['Ignore'] = { fg = colours.black }
  syntax['Include'] = { fg = colours.snow }
  syntax['Keyword'] = { fg = colours.darkSkyBlue }
  syntax['Label'] = { fg = colours.snow }
  syntax['LineNR'] = { fg = colours.snow }
  syntax['Macro'] = { fg = colours.paleViolet }
  syntax['Normal'] = { fg = colours.gainsboro }
  syntax['NormalFloat'] = { fg = colours.gainsboro, bg = colours.night }
  syntax['Number'] = { fg = colours.snow }
  syntax['Numeric'] = { fg = colours.snow }
  syntax['Operator'] = { fg = colours.periwinkle }
  syntax['Pmenu'] = { fg = colours.gainsboro, bg = colours.night }
  syntax['PmenuSbar'] = { fg = colours.none, bg = colours.night }
  syntax['PmenuSel'] = { fg = colours.black, bg = colours.violet }
  syntax['PreCondit'] = { fg = colours.gainsboro }
  syntax['PreProc'] = { fg = colours.gainsboro }
  syntax['Repeat'] = { fg = colours.darkSkyBlue }
  syntax['Search'] = { fg = colours.black, bg = colours.sunny }
  syntax['SignColumn'] = { fg = colours.none, bg = colours.black }
  syntax['Special'] = { fg = colours.violet }
  syntax['SpecialChar'] = { fg = colours.violet }
  syntax['SpecialComment'] = { fg = colours.violet }
  syntax['Statement'] = { fg = colours.snow }
  syntax['StorageClass'] = { fg = colours.snow }
  syntax['String'] = { fg = colours.tumbleweed }
  syntax['Structure'] = { fg = colours.snow }
  syntax['TabLine'] = { fg = colours.white, bg = colours.night }
  syntax['TabLineFill'] = { fg = colours.night, bg = colours.night }
  syntax['TabLineSel'] = { fg = colours.white, bg = colours.purpleSky }
  syntax['Tag'] = { fg = colours.darkSkyBlue }
  syntax['Title'] = { fg = colours.magenta }
  syntax['Todo'] = { fg = colours.imperialRed }
  syntax['Type'] = { fg = colours.snow }
  syntax['Typedef'] = { fg = colours.snow }
  syntax['Visual'] = { bg = colours.night }
  syntax['WinSeparator'] = { fg = colours.snow }

  --Nvim--
  syntax['NvimCurly'] = syntax['Bracket']
  syntax['NvimParenthesis'] = syntax['Bracket']

  --C--
  syntax['cBracket'] = syntax['Bracket']
  syntax['cParen'] = syntax['Bracket']
  syntax['cTSPunctBracket'] = syntax['Bracket']
  syntax['cInclude'] = syntax['Include']
  syntax['cTSInclude'] = syntax['Include']
  syntax['cType'] = syntax['Type']
  syntax['cTSType'] = syntax['Type']
  syntax['cConstant'] = syntax['Constant']

  --Lua--
  syntax['luaParen'] = syntax['Bracket']
  syntax['luaBlock'] = syntax['Bracket']
  syntax['luaFunc'] = syntax['Function']
  syntax['luaFunction'] = syntax['Function']
  syntax['luaTable'] = syntax['Bracket']
  syntax['luaTSPunctBracket'] = syntax['Bracket']

  --Markdown--
  syntax['@punctuation.special'] = syntax['Label']
  syntax['@markup.heading'] = syntax['Title']
  syntax['@markup.link'] = syntax['Normal']
  syntax['@markup.link.label'] = syntax['Identifier']
  syntax['@markup.link.url'] = { fg = colours.frenchSkyBlue }
  syntax['@markup.list'] = { fg = colours.paleViolet }
  syntax['@markup.raw'] = { fg = colours.purpleSky }
  syntax['@markup.quote'] = { fg = colours.winter }
  syntax['@markup.strong'] = { fg = colours.sunny }
  syntax['@markup.italic'] = { fg = colours.mango }

  --Treesitter--
  syntax['@field'] = { fg = colours.darkSkyBlue }
  syntax['@variable'] = { fg = colours.winter }
  syntax['@function.macro'] = syntax['Macro']
  syntax['@function.builtin'] = syntax['Function']
  syntax['@function.call'] = syntax['Function']
  syntax['@constant.builtin'] = syntax['Constant']
  syntax['@type.builtin'] = syntax['Keyword']
  syntax['@boolean'] = syntax['Boolean']
  syntax['@punctuation.bracket'] = syntax['Bracket']

  --Lualine--
  syntax['lualineActiveBuffer'] = { fg = colours.maastrichtBlue, bg = colours.jasmine }

  --Netrw--
  syntax['netrwGray'] = { bg = colours.night }
  syntax['Folded'] = { bg = colours.night }
  syntax['FoldColumn'] = { bg = colours.night }

  --Lsp--
  syntax['@lsp.type.variable'] = { fg = colours.winter }
  syntax['@lsp.type.namespace'] = syntax['Identifier']
  syntax['@lsp.type.macro'] = syntax['Macro']
  syntax['LspCodeLens'] = { fg = colours.snowIce }
  syntax['LspInlayHint'] = syntax['LspCodeLens']

  --Html--
  syntax['@tag'] = syntax['Tag']
  syntax['@tag.attribute'] = { fg = colours.violet }

  --HtmlAngular--
  syntax['htmlTag'] = { fg = colours.violet }
  syntax['htmlEndTag'] = { fg = colours.violet }
  syntax['htmlTagN'] = syntax['Tag']
  syntax['htmlTagName'] = syntax['Tag']

  --Telescope--
  syntax['TelescopeBorder'] = { bg = colours.night, fg = colours.snow }
  syntax['TelescopePromptCounter'] = { fg = colours.snow }
  syntax['TelescopePromptCounter'] = { fg = colours.snow }
  syntax['TelescopeSelection'] = { bg = colours.chineseBlack }
  syntax['TelescopeNormal'] = { fg = colours.gainsboro, bg = colours.night }
  syntax['TelescopeMatching'] = { fg = colours.sunny }
  syntax['TelescopePreviewExecute'] = { fg = colours.magenta }
  syntax['TelescopePreviewSize'] = { fg = colours.winter }

  --Quickfix--
  syntax['QuickFixLine'] = { fg = colours.black, bg = colours.violet }

  --Diff--
  syntax['DiffAdd'] = { fg = colours.darkSkyBlue }
  syntax['DiffChange'] = { fg = colours.jasmine }
  syntax['DiffDelete'] = { fg = colours.magenta }
  syntax['DiffText'] = { bg = colours.night }

  --Git--
  syntax['Added'] = { fg = colours.darkSkyBlue }
  syntax['Changed'] = { fg = colours.jasmine }
  syntax['Removed'] = { fg = colours.magenta }

  --Zsh--
  syntax['zshVariable'] = { fg = colours.darkSkyBlue }
  syntax['zshVariableDef'] = syntax['zshVariable']
  syntax['zshFunction'] = syntax['Function']

  --Rust--
  syntax['@RustFieldExpression'] = { fg = colours.violet }

  --Ibl--
  syntax['IblIndent'] = { fg = colours.darkPurple }
  syntax['IblScope'] = { fg = colours.purpleSky }

  --Dap--
  syntax['DapUINormal'] = { fg = colours.periwinkle }
  syntax['DapUIVariable'] = { fg = colours.periwinkle }
  syntax['DapUIScope'] = { fg = colours.frenchSkyBlue }
  syntax['DapUIType'] = { fg = colours.periwinkle }
  syntax['DapUIValue'] = { fg = colours.periwinkle }
  syntax['DapUIModifiedValue'] = { fg = colours.periwinkle }
  syntax['DapUIDecoration'] = { fg = colours.periwinkle }
  syntax['DapUIThread'] = { fg = colours.frenchSkyBlue }
  syntax['DapUIStoppedThread'] = { fg = colours.periwinkle }
  syntax['DapUIFrameName'] = { fg = colours.periwinkle }
  syntax['DapUISource'] = { fg = colours.periwinkle }
  syntax['DapUILineNumber'] = { fg = colours.snow }
  syntax['DapUIFloatBorder'] = { fg = colours.periwinkle }
  syntax['DapUIWatchesValue'] = { fg = colours.frenchSkyBlue }
  syntax['DapUIWatchesEmpty'] = { fg = colours.periwinkle }
  syntax['DapUIWatchesError'] = { fg = colours.imperialRed }
  syntax['DapUIBreakpointsPath'] = { fg = colours.frenchSkyBlue }
  syntax['DapUIBreakpointsInfo'] = { fg = colours.periwinkle }
  syntax['DapUIBreakpointsCurrentLine'] = { fg = colours.periwinkle }
  syntax['DapUIBreakpointsLine'] = { fg = colours.periwinkle }
  syntax['DapUIBreakpointsDisabledLine'] = { fg = colours.periwinkle }
  syntax['DapUICurrentFrameName'] = { fg = colours.frenchSkyBlue }
  syntax['DapUIStepOver'] = { fg = colours.periwinkle }
  syntax['DapUIStepInto'] = { fg = colours.periwinkle }
  syntax['DapUIStepBack'] = { fg = colours.periwinkle }
  syntax['DapUIStepOut'] = { fg = colours.periwinkle }
  syntax['DapUIStop'] = { fg = colours.periwinkle }
  syntax['DapUIPlayPause'] = { fg = colours.periwinkle }
  syntax['DapUIRestart'] = { fg = colours.periwinkle }
  syntax['DapUIUnavailable'] = { fg = colours.night }
  syntax['DapUIWinSelect'] = { fg = colours.periwinkle }
  syntax['DapUIPlayPauseNC'] = { fg = colours.periwinkle }
  syntax['DapUIRestartNC'] = { fg = colours.periwinkle }
  syntax['DapUIStopNC'] = { fg = colours.periwinkle }
  syntax['DapUIUnavailableNC'] = { fg = colours.night }
  syntax['DapUIStepOverNC'] = { fg = colours.periwinkle }
  syntax['DapUIStepIntoNC'] = { fg = colours.periwinkle }
  syntax['DapUIStepBackNC'] = { fg = colours.periwinkle }
  syntax['DapUIStepOutNC'] = { fg = colours.periwinkle }

  --Blink--
  syntax['BlinkCmpMenuBorder'] = syntax['FloatBorder']
  syntax['BlinkCmpScrollBarThumb'] = { bg = colours.winter }

  for group, highlights in pairs(syntax) do
    utils.highlighter(group, highlights)
  end
end

return M
