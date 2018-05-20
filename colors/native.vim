" Vim color file
"
" Name: native
" Maintainer: Santiago Herrera Cardona <santiagohecar@gmail.com>

set background=light

if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

set t_Co=256
let g:colors_name = "native"

function! s:DoHi(group, hi)

  if exists("a:hi.link")
    execute "hi link ".a:group." ".a:hi.link
    return
  endif
  
  let none    = {"term":"NONE", "hex":"NONE"}
  let fgcolor = get(s:pallete, get(a:hi, 'fg', ''), none)
  let bgcolor = get(s:pallete, get(a:hi, 'bg', ''), none)
  let opt     = get(a:hi, 'opt', 'none')
  
  let command  = "hi ".a:group
  let command .= " guifg   = ".fgcolor["hex"]."  guibg   = ".bgcolor["hex"]."  gui   = ".opt
  let command .= " ctermfg = ".fgcolor["term"]." ctermbg = ".bgcolor["term"]." cterm = ".opt

  execute command
endfunction

function! s:Hi(hi)
  for h in keys(a:hi)
    call s:DoHi(h, a:hi[h])
  endfor
endfunction

" ==============================================================================
" PALLETE DEFINITION

let s:pallete = 
\{
  \"Black":        {"term":0,   "hex":"#000000"},
  \"EerieBlack":   {"term":0,   "hex":"#212016"},
  \"Sage":         {"term":144, "hex":"#afaf87"},
  \"Shadow":       {"term":101, "hex":"#87875f"},
  \"DarkVanilla":  {"term":166, "hex":"#C4C49F"},
  \"DesertSand":   {"term":187, "hex":"#d7d7af"},
  \"Blonde":       {"term":15,  "hex":"#F2F2C4"},
  \"Umber":        {"term":15,  "hex":"#5F5E40"},
  \"Tan":          {"term":15,  "hex":"#C8AF87"},
  \"DarkGreen":    {"term":22,  "hex":"#005f00"},
  \"Grey":         {"term":59,  "hex":"#5E5C5C"},
  \"AppleRed":     {"term":15,  "hex":"#B50000"},
  \"Maroon":       {"term":1,   "hex":"#800000"},
  \"DarkOrange":   {"term":166, "hex":"#d75f00"},
  \"Ginger":       {"term":15,  "hex":"#AE6706"},
  \"Brown":        {"term":15,  "hex":"#745822"},
  \"DarkCoral":    {"term":15,  "hex":"#CA5136"},
  \"DarkMagenta":  {"term":15,  "hex":"#720072"},
  \"HonoluluBlue": {"term":15,  "hex":"#035CB0"},
  \"Blue":         {"term":15,  "hex":"#1F3A93"},
  \"SpringGreen":  {"term":29,  "hex":"#00875f"},
  \"Green":        {"term":29,  "hex":"#008000"},
  \"test":         {"term":29,  "hex":"#002c00"},
  \"test2":         {"term":29,  "hex":"#13694F"},
  \"test3":         {"term":29,  "hex":"#01234C"},
  \
\}

let g:native_pallete = s:pallete

" ==============================================================================
" HIGHTLIGHT DEFINITIONS

call s:Hi(
\{
  \"Normal":           {"fg": "EerieBlack", "bg": "DesertSand"},
  \"Visual":           {"bg": "Sage"},
  \"LineNr":           {"fg": "Umber", "bg": "DarkVanilla"},
  \"Comment":          {"fg": "Grey"},
  \"Type":             {"fg": "Maroon"},
  \"Identifier":       {"fg": "EerieBlack"},
  \"SpecialKey":       {"fg": "EerieBlack"},
  \"String":           {"fg": "HonoluluBlue"},
  \"Preproc":          {"fg": "EerieBlack"},
  \"Statement":        {"fg": "AppleRed"},
  \"Special":          {"fg": "AppleRed"},
  \"VertSplit":        {"fg": "Umber",  "bg": "Umber"},
  \"FoldColumn":       {"fg": "EerieBlack",  "bg": "Shadow"},
  \"Folded":           {"fg": "Umber", "bg": "DarkVanilla"},
  \"ColorColumn":      {"fg": "Grey", "bg": "Sage"},
  \"Pmenu":            {"fg": "EerieBlack", "bg": "Sage"},
  \"PmenuSel":         {"fg": "Blonde", "bg": "Shadow"},
  \"PmenuSbar":        {"fg": "Blonde", "bg": "Sage"},
  \"Search":           {"bg": "Sage"},
  \"MatchParen":       {"fg": "Maroon", "bg": "Sage"},
  \
  \"GitGutterAdd":     {"fg": "DarkGreen", "bg": "DarkGreen", "opt": "bold"},
  \"GitGutterChange":  {"fg": "HonoluluBlue", "bg": "HonoluluBlue", "opt": "bold"},
  \"GitGutterDelete":  {"fg": "Maroon", "bg": "Maroon", "opt": "bold"},
  \
  \"Error":            {"fg": "Maroon", "bg": "DarkVanilla", "opt": "bold"},
  \"ErrorMsg":         {"fg": "Maroon" },
  \"Conditional":      {"fg": "AppleRed"},
  \"Operator":         {"fg": "AppleRed"},
  \"Function":         {"fg": "AppleRed"},
  \"NERDTreeExecFile": {"fg": "EerieBlack", "bg": "DesertSand"},
  \"Directory":        {"fg": "HonoluluBlue"},
  \"CursorLine":       {"bg": "Sage"},
  \"Todo":             {"fg": "Grey", "bg": "DesertSand"},
  \"NERDTreeCWD":      {"fg": "AppleRed"},
  \"Number":           {"fg": "AppleRed"},
  \"EndOfBuffer":      {"fg": "DesertSand", "bg": "DesertSand"},
  \"SyntasticErrorLine":      { "bg": "Tan"},
\})

" PHP --------------------------------------------------------------------------
call s:Hi(
\{
  \"phpSuperglobals":      {"fg": "HonoluluBlue"}, 
  \"phpMagicConstants":    {"fg": "AppleRed"}, 
  \"phpServerVars":        {"fg": "AppleRed"}, 
  \"phpConstants":         {"fg": "AppleRed"}, 
  \"phpFunctions":         {"fg": "Maroon"}, 
  \"phpClasses":           {"fg": "DarkOrange"}, 
  \"phpKeyword":           {"fg": "test3"}, 
  \"phpType":              {"fg": "Brown"}, 
  \"phpStatement":         {"fg": "DarkOrange"}, 
  \"phpInclude":           {"fg": "AppleRed"}, 
  \"phpOperator":          {"fg": "AppleRed"}, 
  \"phpVarSelector":       {"fg": "DarkGreen"}, 
  \"phpMemberSelector":    {"fg": "AppleRed"}, 
  \"phpMethodsVar":        {"fg": "DarkGreen"}, 
  \"phpMethod":            {"fg": "test2"}, 
  \"phpIdentifier":        {"fg": "DarkGreen"},
  \"phpIdentifierSimply":  {"fg": "HonoluluBlue"},
  \"phpIdentifierComplex": {"fg": "HonoluluBlue"},
  \"phpIdentifierArray":   {"fg": "HonoluluBlue"},
  \"phpBoolean":           {"fg": "DarkCoral"},
  \"phpNumber":            {"fg": "DarkOrange"},
  \"phpSpecialChar":       {"fg": "SpringGreen"},
  \"phpStrEsc":            {"fg": "DarkGreen"},
  \"phpStaticClasses":     {"fg": "DarkMagenta"},
  \"phpClass":             {"fg": "DarkMagenta"},
  \"phpFunction":          {"fg": "Ginger"},
  \"jsBuiltins":           {"fg": "AppleRed"},
\})

" JAVASCRIPT --------------------------------------------------------------------------
call s:Hi(
\{
  \"jsBrackets":      {"fg": "Maroon"}, 
  \"jsParens":        {"fg": "Maroon"}, 
  \"jsFuncParens":    {"fg": "Maroon"}, 
  \"jsFuncBraces":    {"fg": "Maroon"}, 
  \"jsObjectBraces":  {"fg": "Maroon"}, 
  \"jsIfElseBraces":  {"fg": "Maroon"}, 
  \"jsObjectProp":    {"fg": "HonoluluBlue"}, 
  \"jsFuncCall":      {"fg": "HonoluluBlue"}, 
  \"jsReturn":        {"fg": "AppleRed"}, 
  \"jsStatement":     {"fg": "AppleRed"}, 
  \"jsGlobalObjects": {"fg": "DarkOrange"}, 
  \"jsFuncName":      {"fg": "DarkOrange"}, 
  \"jsPrototype":     {"fg": "DarkOrange"}, 
  \"jsThis":          {"fg": "HonoluluBlue"}, 
  \"jsFuncBlock":     {"fg": "HonoluluBlue"}, 
  \"jsIfElseBlock":   {"fg": "HonoluluBlue"}, 
  \"jsParenIfElse":   {"fg": "HonoluluBlue"}, 
  \"jsFuncArgs":      {"fg": "HonoluluBlue"}, 
  \"jsParen":         {"fg": "HonoluluBlue"}, 
  \"jsTernaryIf":     {"fg": "HonoluluBlue"}, 
  \"jsBracket":       {"fg": "HonoluluBlue"}, 
  \"jsVariableDef":   {"fg": "HonoluluBlue"}, 
  \"jsSwitchBlock":   {"fg": "HonoluluBlue"},
  \"jsParenSwitch":   {"fg": "HonoluluBlue"},
\})

" TYPESCRIPT --------------------------------------------------------------------------
call s:Hi(
\{
  \"typescriptBraces":              {"fg": "Maroon"}, 
  \"typescriptParens":              {"fg": "Maroon"}, 
  \"typescriptDecorator":           {"fg": "DarkOrange"}, 
  \"typescriptBrowserObjects":      {"fg": "DarkOrange"}, 
  \"typescriptDOMObjects":          {"fg": "DarkOrange"}, 
  \"typescriptGlobalObjects":       {"fg": "DarkOrange"}, 
  \"typescriptOperator":            {"fg": "AppleRed"}, 
  \"typescriptClassName":           {"fg": "DarkOrange"}, 
  \"typescriptMemberVariableDeclaration": {"fg": "HonoluluBlue"}, 
  \"typescriptVariableDeclaration": {"fg": "HonoluluBlue"}, 
  \"typescriptIdentifier":          {"fg": "HonoluluBlue"}, 
  \"typescriptMethodName":          {"fg": "DarkOrange"}, 
  \"typescriptProp":                {"fg": "HonoluluBlue"}, 
  \"typescriptCall":                {"fg": "HonoluluBlue"}, 
  \"typescriptTypeReference":       {"fg": "DarkOrange"}, 
  \"typescriptImport":              {"fg": "AppleRed"}, 
  \"typescriptObjectLabel":         {"fg": "HonoluluBlue"}, 
  \"typescriptMethodBlock":         {"fg": "HonoluluBlue"}, 
  \"typescriptOpSymbols":           {"fg": "Maroon"}, 
  \"typescriptConditionalParen":    {"fg": "HonoluluBlue"}, 
  \"typescriptVariable":            {"fg": "AppleRed"}, 
  \"typescriptExport":              {"fg": "AppleRed"}, 
  \"typescriptMethodAccessor":      {"fg": "AppleRed"}, 
  \"typescriptClassHeritage":       {"fg": "DarkOrange"}, 
  \"typescriptGlobal":              {"fg": "DarkOrange"}, 
\})

" CSS --------------------------------------------------------------------------
call s:Hi(
\{
  \"cssTagName":            {"fg": "EerieBlack"}, 
  \"cssPositioningProp":    {"fg": "HonoluluBlue"}, 
  \"cssTextProp":           {"fg": "HonoluluBlue"}, 
  \"cssPageProp":           {"fg": "HonoluluBlue"}, 
  \"cssDimensionProp":      {"fg": "HonoluluBlue"}, 
  \"cssBoxProp":            {"fg": "HonoluluBlue"}, 
  \"cssListProp":           {"fg": "HonoluluBlue"}, 
  \"cssUIProp":             {"fg": "HonoluluBlue"}, 
  \"cssBackgroundProp":     {"fg": "HonoluluBlue"}, 
  \"cssBorderProp":         {"fg": "HonoluluBlue"}, 
  \"cssFontProp":           {"fg": "HonoluluBlue"}, 
  \"cssMobileTextProp":     {"fg": "HonoluluBlue"}, 
  \"cssFontDescriptorProp": {"fg": "HonoluluBlue"}, 
  \"cssIEUIProp":           {"fg": "HonoluluBlue"}, 
  \"cssFlexibleBoxProp":    {"fg": "HonoluluBlue"}, 
  \"cssClassName":          {"fg": "DarkOrange"}, 
  \"cssBraces":             {"fg": "Maroon"}, 
  \"cssPseudoClassId":      {"fg": "AppleRed"}, 
  \"cssPseudoClassFn":      {"fg": "AppleRed"}, 
  \"cssImportant":          {"fg": "AppleRed"}, 
  \"cssIncludeKeyword":     {"fg": "AppleRed"}, 
  \"cssAttrRegion":         {"fg": "Maroon"}, 
  \"cssInclude":            {"fg": "Maroon"}, 
  \"cssPseudoClass":        {"fg": "AppleRed"}, 
\})

" HTML --------------------------------------------------------------------------
call s:Hi(
\{
  \"htmlTagName": {"fg": "DarkOrange"}, 
  \"htmlTag":     {"fg": "DarkOrange"}, 
  \"htmlEndTag":  {"fg": "DarkOrange"}, 
  \"htmlTagN":    {"fg": "DarkOrange"}, 
  \"htmlArg":     {"fg": "HonoluluBlue"}, 
  \"htmlLink":    {"fg": "EerieBlack"}, 
\})

