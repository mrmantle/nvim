" Elflords Neovim color file
" Custom colours based on Elflord theme

set background=dark
hi clear

if exists('syntax_on')
    syntax reset
endif

let g:colors_name = 'elflords'

" Syntax highlighting
hi Comment	guifg=DarkCyan	ctermfg=DarkCyan	term=bold
hi Constant	guifg=Magenta	ctermfg=Magenta		term=underline
hi Special	guifg=Magenta	ctermfg=Magenta		term=bold
hi PreProc	guifg=Cyan	ctermfg=Cyan		term=underline
hi Function	guifg=cfb	ctermfg=Blue		term=bold
hi Repeat	guifg=cfb	ctermfg=Blue		term=underline
hi Identifier	guifg=Cyan	ctermfg=Cyan		term=underline	cterm=bold
hi Statement	guifg=Cyan	ctermfg=Cyan		term=bold	gui=bold
hi Type		guifg=Magenta	ctermfg=Magenta		term=underline	gui=bold
hi Error	guifg=White	ctermfg=White		term=reverse	guibg=Red
hi Todo		guifg=Blue	ctermfg=Black		term=standout	guibg=Yellow
hi Operator	guifg=DarkCyan	ctermfg=DarkCyan
hi Ignore	guifg=bg      	ctermfg=Black
hi LineNr	guifg=DarkRed	ctermfg=DarkRed
hi Normal	guifg=Cyan						guibg=Black

" Common groups that link to default highlighting.
" You can specify other highlighting easily.
hi link String		Constant
hi link Character	Constant
hi link Number		Constant
hi link Boolean		Constant
hi link Float		Number
hi link Conditional	Repeat
hi link Label		Statement
hi link Keyword		Statement
hi link Exception	Statement
hi link Include		PreProc
hi link Define		PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass	Type
hi link Structure	Type
hi link Typedef		Type
hi link Tag		Special
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment	Special
hi link Debug		Special
