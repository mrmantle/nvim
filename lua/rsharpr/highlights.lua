local M = {}
local cmd = vim.cmd
local g = vim.g
local fn = vim.fn
local utils = require('rsharpr.utils')

cmd('hi clear')

if fn.exists("syntax_on") then
  cmd('syntax reset')
end

g.colors_name = 'rsharpr'

function M.load_syntax(colours)
  local syntax = {}

  syntax['Boolean'] = { fg = colours.darkSkyBlue }
  syntax['Bracket'] = { fg = colours.gainsboro }
  syntax['Character'] = { fg = colours.gainsboro }
  syntax['Comment'] = { fg = colours.darkCyan }
  syntax['Conditional'] = { fg = colours.darkSkyBlue }
  syntax['Constant'] = { fg = colours.violet }
  syntax['Debug'] = { fg = colours.blacklight }
  syntax['Define'] = { fg = colours.snow }
  syntax['Delimiter'] = { fg = colours.gainsboro }
  syntax['Directory'] = { fg = colours.darkSkyBlue }
  syntax['EndOfBuffer'] = { fg = colours.black }
  syntax['Error'] = { fg = colours.imperialRed, bg = colours.black }
  syntax['ErrorMsg'] = { fg = colours.imperialRed }
  syntax['Exception'] = { fg = colours.imperialRed }
  syntax['Float'] = { fg = colours.snow }
  syntax['Function'] = { fg = colours.cyan }
  syntax['Identifier'] = { fg = colours.darkSkyBlue }
  syntax['Ignore'] = { fg = colours.black }
  syntax['Include'] = { fg = colours.snow }
  syntax['Keyword'] = { fg = colours.darkSkyBlue }
  syntax['Label'] = { fg = colours.snow }
  syntax['LineNR'] = { fg = colours.snow }
  syntax['Macro'] = { fg = colours.paleViolet }
  syntax['Normal'] = { fg = colours.gainsboro }
  syntax['Number'] = { fg = colours.snow }
  syntax['NormalFloat'] = { fg = colours.gainsboro, bg = colours.night }
  syntax['Numeric'] = { fg = colours.snow }
  syntax['Operator'] = { fg = colours.gainsboro }
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
  syntax['cConstant'] = syntax['Constand']

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
  syntax['@type.qualifier'] = syntax['Keyword']
  syntax['@type.builtin'] = syntax['Keyword']
  syntax['@include'] = syntax['Keyword']
  syntax['@boolean'] = syntax['Boolean']

  --C#--
  syntax['@CSharpMemberAccess'] = { fg = colours.violet }
  syntax['@CSharpConstructorAssignment'] = { fg = colours.violet }

  --Lualine--
  syntax['lualineActiveBuffer'] = { fg = colours.maastrichtBlue, bg = colours.jasmine }

  --Netrw--
  syntax['netrwGray'] = { bg = colours.night }
  syntax['Folded'] = { bg = colours.night }
  syntax['FoldColumn'] = { bg = colours.night }
  syntax['CursorLine'] = { bg = colours.night }

  --Lsp--
  syntax['@lsp.type.variable'] = { fg = colours.winter }
  syntax['@lsp.type.namespace'] = syntax['Identifier']
  syntax['@lsp.type.macro'] = syntax['Macro']

  --Html--
  syntax['@tag'] = syntax['Tag']
  syntax['@tag.attribute'] = { fg = colours.violet }

  --Telescope--
  syntax['TelescopePromptCounter'] = { fg = colours.snow }
  syntax['TelescopeSelection'] = { fg = colours.black, bg = colours.violet }
  syntax['TelescopeNormal'] = { fg = colours.gainsboro, bg = colours.night }
  syntax['TelescopeMatching'] = { fg = colours.sunny }

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

  --Dap--
  syntax['NvimDapVirtualText'] = { fg = colours.night }

  for group, highlights in pairs(syntax) do
    utils.highlighter(group, highlights)
  end
end

return M
