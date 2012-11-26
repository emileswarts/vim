" Maintainer:   Emile Swarts
" Last Change:  2012/10/04
" URL: https://github.com/emileswarts/skywalker
"
" SETUP {{{
set background=dark
hi clear

if version > 580
	" You gotta upgrade
	if exists("syntax_on")
		syntax reset
	endif
endif

let g:colors_name = "skywalker"
"}}}
" DEFINE COLOURS {{{

"Anything marked as bright yellow (should not be much) is still a work in progress and has not showed up in my testing

"greys
let s:vc = {}
let s:vc.tokyowhite 		  	= ['FFFFFF', 15]  " 1
let s:vc.pidgeon   	  		  	= ['EBE8E9', 252] " 2 
let s:vc.mac    	  		  	= ['C9C9C9', 245] " 3 
let s:vc.crane 		  		  	= ['B8B6B7', 242] " 4
let s:vc.shuttle   	  		  	= ['ABA9AA', 240] " 5
let s:vc.tank     	  		  	= ['757474', 238] " 6 
let s:vc.sneaker   	  		  	= ['6B6A6A', 236] " 7 
let s:vc.tile     	  			= ['4A4A48', 235] " 8 
let s:vc.coal    	  			= ['242321', 233] " 9 
let s:vc.offblack 		  		= ['111111', 232] " 111 
let s:vc.rhino 		  			= ['3D3D3D', 238]  " 000

"purples
let s:vc.lipstick      			= ['FF03D9', 201]
let s:vc.purpleghost      		= ['C003FF', 93]
let s:vc.palepurple   	 		= ['DA7AFA', 98]
let s:vc.palestpurple   	 	= ['DA7AFA', 141]
let s:vc.lotus     				= ['E543FA', 165]
let s:vc.peyote   	 			= ['CD7CFC', 135]
let s:vc.lilac   	 			= ['E94AF7', 198]
let s:vc.pink 		  			= ['FF036C', 197]                          

let s:vc.clownfish 	 			= ['FA9302', 166]
let s:vc.gold  	 				= ['FAB802', 208]

let s:vc.blood 	 				= ['FF0000', 196]
let s:vc.tomato 	 			= ['D40000', 160]
let s:vc.archlinux   			= ['1CCCFC', 45]

let s:vc.desert 		 		= ['FAE79D', 186]
let s:vc.pine 		 			= ['F5FCC5', 192]

let s:vc.commanderkp 		 	= ['94AB00', 58]
let s:vc.mold 		 			= ['008C59', 65]
let s:vc.terradactyl 		 	= ['7B914A', 101]
let s:vc.afghan 	  	 		= ['B5C299', 187]

let s:vc.aqua 		 			= ['00FFF2', 87]
let s:vc.brightyellow			= ['E5FF00', 220]

" }}}
" CATCH BLACK BACKGROUND {{{
if ! exists("g:skywalker_black_background")
	let g:skywalker_black_background = 0
endif
"}}}
" HIGHLIGHTING FUNCTION {{{
function! s:HL(group, fg, ...)
	" Arguments: group, guifg, guibg, gui, guisp

	let histring = 'hi ' . a:group . ' '

	if strlen(a:fg)
		if a:fg == 'fg'
			let histring .= 'guifg=fg ctermfg=fg '
		else
			let c = get(s:vc, a:fg)
			let histring .= 'guifg=#' . c[0] . ' ctermfg=' . c[1] . ' '
		endif
	endif

	if a:0 >= 1 && strlen(a:1)
		if a:1 == 'bg'
			let histring .= 'guibg=bg ctermbg=bg '
		else
			let c = get(s:vc, a:1)
			let histring .= 'guibg=#' . c[0] . ' ctermbg=' . c[1] . ' '
		endif
	endif

	if a:0 >= 2 && strlen(a:2)
		let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
	endif

	if a:0 >= 3 && strlen(a:3)
		let c = get(s:vc, a:3)
		let histring .= 'guisp=#' . c[0] . ' '
	endif

	" echom histring

	execute histring
endfunction
" }}}
" CONFIGURATION OPTIONS {{{
if exists('g:skywalker_black') && g:skywalker_black
	let s:darkness = 'shuttle'
else
	let s:darkness = 'coal'
endif
" }}}
" VANILLA VIM {{{
" GENERAL/UI {{{
call s:HL('Normal', 'tokyowhite', 'coal')
call s:HL('Folded', 'shuttle', 'bg', 'none')
call s:HL('VertSplit', 'mac', 'bg', 'none')
call s:HL('CursorLine',   '', 'tile', 'none')
call s:HL('CursorColumn', '', 'tile')
call s:HL('ColorColumn',  '', 'tile')
call s:HL('MatchParen', 'blood', 'offblack', 'bold')
call s:HL('NonText',    'tank', 'bg')
call s:HL('SpecialKey', 'tank', 'bg')
call s:HL('Visual',    '',  'tank')
call s:HL('VisualNOS', '',  'tank')
call s:HL('Search',    'blood', 'coal', 'bold')
call s:HL('IncSearch', 'tomato', 'coal',    'bold')
call s:HL('Underlined', 'fg', '', 'underline')
call s:HL('StatusLine',   'rhino', 'archlinux',     'bold')
call s:HL('StatusLineNC', 'blood', 'tank', 'bold')
call s:HL('Directory', 'clownfish', '', 'bold')
call s:HL('Title', 'clownfish')
call s:HL('ErrorMsg',   'palepurple',       'bg', 'bold')
call s:HL('MoreMsg',    'blood',   '',   'bold')
call s:HL('ModeMsg',    'afghan', '',   'bold')
call s:HL('Question',   'afghan', '',   'bold')
call s:HL('WarningMsg', 'blood',       '',   'bold')
call s:HL('Tag', '', '', 'bold')

call s:HL('WildMenu', 'tank', '',   'bold')
call s:HL('IndentGuides', 'tank', '',   'bold')

" }}}
" BLACKNESS {{{
call s:HL('LineNr', 'rhino', 'offblack')
call s:HL('SignColumn', '', s:darkness)
call s:HL('FoldColumn', 'shuttle', s:darkness)

" }}}
" CURSOR {{{

call s:HL('Cursor',  'rhino', 'archlinux', 'bold')
call s:HL('vCursor', 'rhino', 'archlinux', 'bold')
call s:HL('iCursor', 'rhino', 'archlinux', 'none')

" }}}
" SYNTAX HIGHLIGHTING {{{

call s:HL('Special', 'tokyowhite')
call s:HL('Comment', 'sneaker', 'coal')
call s:HL('Todo',           'tokyowhite', 'bg', 'bold')
call s:HL('SpecialComment', 'tokyowhite', 'bg', 'bold')
call s:HL('String', 'afghan')
call s:HL('Statement',   'palepurple', '', 'bold')
call s:HL('Keyword',     'palepurple', '', 'bold')
call s:HL('Conditional', 'palepurple', '', 'bold')
call s:HL('Operator',    'palepurple', '', 'none')
call s:HL('Label',       'palepurple', '', 'none')
call s:HL('Repeat',      'palepurple', '', 'none')

call s:HL('Identifier', 'purpleghost', '', 'none')
call s:HL('Function',   'purpleghost', '', 'none')

call s:HL('PreProc',   'archlinux', '', 'none')
call s:HL('Macro',     'archlinux', '', 'none')
call s:HL('Define',    'gold', '', 'none')  "php functions in here
call s:HL('PreCondit', 'tank', '', 'bold')

call s:HL('Constant',  'archlinux', '', 'bold')
call s:HL('Character', 'archlinux', '', 'bold')
call s:HL('Boolean',   'archlinux', '', 'bold')

call s:HL('Number', 'clownfish', '', 'bold')
call s:HL('Float',  'clownfish', '', 'bold')
call s:HL('SpecialChar', 'clownfish', '', 'bold')

call s:HL('Type', 'clownfish', '', 'none')
call s:HL('StorageClass', 'palepurple', '', 'none')
call s:HL('Structure', 'palepurple', '', 'none')
call s:HL('Typedef', 'palepurple', '', 'bold')

call s:HL('Exception', 'aqua', '', 'bold')

" Misc
call s:HL('Error',  'tokyowhite',   'blood', 'bold')
call s:HL('Debug',  'tokyowhite',   '',      'bold')
call s:HL('Ignore', 'crane', '',      '')

" }}}
" COMPLETION MENU {{{
call s:HL('Pmenu', 'commanderkp', 'offblack')
call s:HL('PmenuSel', 'blood', 'coal')
call s:HL('PmenuSbar', '', 'shuttle')
call s:HL('PmenuThumb', 'archlinux')
" COMPLETION MENU {{{


" }}}
" DIFFS {{{
call s:HL('DiffDelete', 'rhino', 'rhino')
call s:HL('DiffAdd',    '',     'sneaker')
call s:HL('DiffChange', '',     'tile')
call s:HL('DiffText',   'tokyowhite', 'sneaker', 'bold')
" }}}
" SPELLING {{{
if has("spell")
	call s:HL('SpellCap', 'blood', 'bg', 'undercurl,bold', 'blood')
	call s:HL('SpellBad', 'rhino', '', 'undercurl', 'clownfish')
	call s:HL('SpellLocal', '', '', 'undercurl', 'blood')
	call s:HL('SpellRare', '', '', 'undercurl', 'blood')
endif
" }}}
" }}}
" PLUGINS {{{
" CTRLP {{{
call s:HL('CtrlPNoEntries', 'tokyowhite', 'blood', 'bold')
call s:HL('CtrlPMatch', 'purpleghost', 'bg', 'none')
call s:HL('CtrlPLinePre', 'tank', 'bg', 'none')

" the prompt’s base
call s:HL('CtrlPPrtBase', 'tank', 'bg', 'none')

" the prompt’s text
call s:HL('CtrlPPrtText', 'tokyowhite', 'bg', 'none')

" the prompt’s cursor when moving over the text
call s:HL('CtrlPPrtCursor', 'rhino', 'archlinux', 'bold')

" 'prt' or 'win', also for 'regex'
call s:HL('CtrlPMode1', 'rhino', 'archlinux', 'bold')

" 'file' or 'path', also for the local working dir
call s:HL('CtrlPMode2', 'rhino', 'archlinux', 'bold')

" the scanning status
call s:HL('CtrlPStats', 'rhino', 'archlinux', 'bold')

" TODO: CtrlP extensions.
" CtrlPTabExtra  : the part of each line that’s not matched against (Comment)
" CtrlPqfLineCol : the line and column numbers in quickfix mode (|s:HL-Search|)
" CtrlPUndoT     : the elapsed time in undo mode (|s:HL-Directory|)
" CtrlPUndoBr    : the square brackets [] in undo mode (Comment)
" CtrlPUndoNr    : the undo number inside [] in undo mode (String)

" }}}
" EasyMotion {{{

call s:HL('EasyMotionTarget', 'archlinux',     'bg', 'bold')
call s:HL('EasyMotionShade',  'tank', 'bg')

" }}}
" ShowMarks {{{
call s:HL('ShowMarksHLl', 'archlinux', 'coal')
call s:HL('ShowMarksHLu', 'archlinux', 'coal')
call s:HL('ShowMarksHLo', 'archlinux', 'coal')
call s:HL('ShowMarksHLm', 'archlinux', 'coal')
" }}}

" }}}
" FILETYPE-SPECIFIC {{{
" Clojure {{{
call s:HL('clojureSpecial',  'palepurple', '', '')
call s:HL('clojureDefn',     'palepurple', '', '')
call s:HL('clojureDefMacro', 'palepurple', '', '')
call s:HL('clojureDefine',   'palepurple', '', '')
call s:HL('clojureMacro',    'palepurple', '', '')
call s:HL('clojureCond',     'palepurple', '', '')
call s:HL('clojureKeyword', 'purpleghost', '', 'none')
call s:HL('clojureFunc',   'blood', '', 'none')
call s:HL('clojureRepeat', 'blood', '', 'none')
call s:HL('clojureParen0', 'mac', '', 'none')
call s:HL('clojureAnonArg', 'tokyowhite', '', 'bold')
" }}}
" CSS {{{
call s:HL('cssColorProp', 'afghan', '', 'none')
call s:HL('cssBoxProp', 'afghan', '', 'none')
call s:HL('cssTextProp', 'afghan', '', 'none')
call s:HL('cssRenderProp', 'afghan', '', 'none')
call s:HL('cssGeneratedContentProp', 'afghan', '', 'none')
call s:HL('cssValueLength', 'afghan', '', 'bold')
call s:HL('cssColor', 'afghan', '', 'bold')
call s:HL('cssBraces', 'mac', '', 'none')
call s:HL('cssIdentifier', 'purpleghost', '', 'bold')
call s:HL('cssClassName', 'purpleghost', '', 'none')
" }}}
" Diff {{{
call s:HL('gitDiff', 'mac', '',)
call s:HL('diffRemoved', 'blood', '',)
call s:HL('diffAdded', 'aqua', '',)
call s:HL('diffFile', 'rhino', 'palepurple', 'bold')
call s:HL('diffNewFile', 'rhino', 'palepurple', 'bold')
call s:HL('diffLine', 'rhino', 'purpleghost', 'bold')
call s:HL('diffSubname', 'purpleghost', '', 'none')
" }}}
" HTML {{{
call s:HL('htmlTag',    'purpleghost', 'bg', 'none')
call s:HL('htmlEndTag', 'purpleghost', 'bg', 'none')
call s:HL('htmlTagName',        'palepurple', '', 'bold')
call s:HL('htmlSpecialTagName', 'purpleghost', '', 'bold')
call s:HL('htmlSpecialChar',    'purpleghost',   '', 'none')
call s:HL('htmlArg', 'purpleghost', '', 'none')
" Stuff inside an <a> tag
call s:HL('htmlLink', 'mac', '', 'underline')

" }}}
" Java {{{
call s:HL('javaClassDecl', 'palepurple', '', 'bold')
call s:HL('javaScopeDecl', 'palepurple', '', 'bold')
call s:HL('javaCommentTitle', 'crane', '')
call s:HL('javaDocTags', 'tokyowhite', '', 'none')
call s:HL('javaDocParam', 'blood', '', '')
" }}}
" LessCSS {{{
call s:HL('lessVariable', 'aqua', '', 'none')
" }}}
" Mail {{{
call s:HL('mailSubject', 'purpleghost', '', 'bold')
call s:HL('mailHeader', 'mac', '', '')
call s:HL('mailHeaderKey', 'mac', '', '')
call s:HL('mailHeaderEmail', 'tokyowhite', '', '')
call s:HL('mailURL', 'afghan', '', 'underline')
call s:HL('mailSignature', 'crane', '', 'none')
call s:HL('mailQuoted1', 'crane', '', 'none')
call s:HL('mailQuoted2', 'blood', '', 'none')
call s:HL('mailQuoted3', 'mold', '', 'none')
call s:HL('mailQuoted4', 'purpleghost', '', 'none')
call s:HL('mailQuoted5', 'aqua', '', 'none')

" }}}
" Markdown {{{
call s:HL('markdownHeadingRule', 'mac', '', 'bold')
call s:HL('markdownHeadingDelimiter', 'mac', '', 'bold')
call s:HL('markdownOrderedListMarker', 'mac', '', 'bold')
call s:HL('markdownListMarker', 'mac', '', 'bold')
call s:HL('markdownItalic', 'tokyowhite', '', 'bold')
call s:HL('markdownBold', 'tokyowhite', '', 'bold')
call s:HL('markdownH1', 'purpleghost', '', 'bold')
call s:HL('markdownH2', 'aqua', '', 'bold')
call s:HL('markdownH3', 'aqua', '', 'none')
call s:HL('markdownH4', 'aqua', '', 'none')
call s:HL('markdownH5', 'aqua', '', 'none')
call s:HL('markdownH6', 'aqua', '', 'none')
call s:HL('markdownLinkText', 'afghan', '', 'underline')
call s:HL('markdownIdDeclaration', 'afghan')
call s:HL('markdownAutomaticLink', 'afghan', '', 'bold')
call s:HL('markdownUrl', 'afghan', '', 'bold')
call s:HL('markdownUrldelimiter', 'mac', '', 'bold')
call s:HL('markdownLinkDelimiter', 'mac', '', 'bold')
call s:HL('markdownLinkTextDelimiter', 'mac', '', 'bold')
call s:HL('markdownCodeDelimiter', 'terradactyl', '', 'bold')
call s:HL('markdownCode', 'terradactyl', '', 'none')
call s:HL('markdownCodeBlock', 'terradactyl', '', 'none')
" }}}
" PHP {{{
call s:HL('phpRegionDelimiter', 'blood', '', 'bold') " php tags
call s:HL('phpPropertySelector', 'clownfish', '', 'bold')
call s:HL('phpPropertySelectorInString', 'clownfish', '', 'bold')
call s:HL('phpOperator', 'clownfish', '', 'bold')
call s:HL('phpArrayPair', 'blood', '', 'bold')
call s:HL('phpAssignByRef', 'blood', '', 'bold')
call s:HL('phpRelation', 'blood', '', 'bold') "need to check
call s:HL('phpMemberSelector', 'clownfish', '', 'bold')
call s:HL('phpUnknownSelector', 'clownfish', '', 'bold')
call s:HL('phpVarSelector', 'peyote', '', 'bold')
call s:HL('phpSemicolon', 'mac', '', 'bold')
call s:HL('phpFunctions', 'clownfish', '', 'bold')
call s:HL('phpParent', 'tokyowhite', '', 'bold')
" }}}
" RUBY {{{
call s:HL('htmlItalic', 'palepurple', '', 'bold')
call s:HL('railsMethod', 'palepurple', '', 'bold')
call s:HL('rubyDefine', 'palepurple', '', 'bold')
call s:HL('rubyDescribe', 'palepurple', '', 'bold')
call s:HL('rubySymbol', 'purpleghost', '', 'bold')
call s:HL('rubyAccess', 'archlinux', '', 'bold')
call s:HL('rubyAttribute', 'brightyellow', '', 'bold')
call s:HL('rubyEval', 'brightyellow', '', 'bold')
call s:HL('rubyException', 'brightyellow', '', 'bold')
call s:HL('rubyInclude', 'purpleghost', '', 'bold')
call s:HL('rubyStringDelimiter', 'terradactyl', '', 'bold')
call s:HL('rubyRegexp', 'mold', '', 'bold')
call s:HL('rubyRegexpDelimiter', 'terradactyl', '', 'bold')
call s:HL('rubyConstant', 'clownfish', '', 'bold')
call s:HL('rubyGlobalVariable', 'brightyellow', '', 'bold')
call s:HL('rubyClassVariable', 'brightyellow', '', 'bold')
call s:HL('rubyInstanceVariable', 'terradactyl', '', 'bold')
" }}}
" MySQL {{{
call s:HL('mysqlSpecial', 'archlinux', '', 'bold')
" }}}
" Python {{{
hi def link pythonOperator Operator
call s:HL('pythonBuiltin',     'blood')
call s:HL('pythonBuiltinObj',  'blood')
call s:HL('pythonBuiltinFunc', 'blood')
call s:HL('pythonEscape',      'blood')
call s:HL('pythonException',   'aqua', '', 'bold')
call s:HL('pythonExceptions',  'aqua', '', 'none')
call s:HL('pythonPrecondit',   'aqua', '', 'none')
call s:HL('pythonDecorator',   'palepurple', '', 'none')
call s:HL('pythonRun',         'crane', '', 'bold')
call s:HL('pythonCoding',      'crane', '', 'bold')
" }}}
" Vim {{{
call s:HL('VimCommentTitle', 'mac', '', 'bold')
call s:HL('VimMapMod',    'blood', '', 'none')
call s:HL('VimMapModKey', 'pine', '', 'none')
call s:HL('VimHiGroup', 'pine', '', 'none')
call s:HL('VimHiGuiFgBg', 'lipstick', '', 'none')
call s:HL('VimHiCtermFgBg', 'lipstick', '', 'none')
call s:HL('VimNotation', 'palepurple', '', 'none')
call s:HL('VimBracket', 'blood', '', 'none')
call s:HL('VimError', 'blood', '', 'none')
" }}}
" }}}
