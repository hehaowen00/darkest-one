local lush = require('lush')

local black = "#000000"
local white = "#ffffff"
local green = "#8ebd6b"
local red = "#e55561"
local blue = "#4fa6ed"
local cyan = "#48b0bd"
local grey = "#626262"
local lightgrey = "#7a818e"
local purple = "#bf68d9"
local orange = "#cc9057"
local yellow = "#e2b86b"
local fg = "#a0a8b7"
local bg0 = "#1f2329"
local bg1 = "#31353f"
local bg_yellow = "#e8c88c"

local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    ColorColumn  { bg = bg1 }, -- Columns set with 'colorcolumn'
    Conceal      { fg = grey, bg = bg1 }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor       { gui = "reverse" }, -- Character under the cursor
    lCursor      { gui = "reverse" }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM     { gui = "reverse" }, -- Like Cursor, but used when in IME mode |CursorIM|
    CursorColumn { bg = bg1 }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine   { }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory    { fg = blue }, -- Directory names (and other special names in listings)
    -- DiffAdd      { }, -- Diff mode: Added line |diff.txt|
    -- DiffChange   { }, -- Diff mode: Changed line |diff.txt|
    -- DiffDelete   { }, -- Diff mode: Deleted line |diff.txt|
    -- DiffText     { }, -- Diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer  { fg = black, bg = black }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    -- TermCursor   { }, -- Cursor in a focused terminal
    -- TermCursorNC { }, -- Cursor in an unfocused terminal
    ErrorMsg     { fg = red, gui = "bold" }, -- Error messages on the command line
    VertSplit    { fg = black, bg = black }, -- Column separating vertically split windows
    -- Folded       { }, -- Line used for closed folds
    -- FoldColumn   { }, -- 'foldcolumn'
    -- SignColumn   { }, -- Column where |signs| are displayed
    IncSearch    { fg = grey, bg = orange }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute   { fg = grey, bg = blue }, -- |:substitute| replacement text highlighting
    LineNr       { fg = grey }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { fg = blue }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    -- MatchParen   { }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea      { }, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    -- MoreMsg      { }, -- |more-prompt|
    -- NonText      { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal       { fg = fg, bg = black }, -- Normal text
    NormalFloat  { fg = fg, bg = black }, -- Normal text in floating windows.
    NormalNC     { fg = fg, bg = black }, -- normal text in non-current windows
    Pmenu        { fg = white, bg = black }, -- Popup menu: Normal item.
    -- PmenuSel     { }, -- Popup menu: Selected item.
    -- PmenuSbar    { }, -- Popup menu: Scrollbar.
    -- PmenuThumb   { }, -- Popup menu: Thumb of the scrollbar.
    -- Question     { }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search       { fg = grey, bg = blue }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    -- SpecialKey   { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    StatusLine   { bg = black }, -- Status line of current window
    -- StatusLineNC { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine      { bg = black }, -- Tab pages line, not active tab page label
    TabLineFill  { bg = black }, -- Tab pages line, where there are no labels
    TabLineSel   { fg = green }, -- Tab pages line, active tab page label
    Title        { fg = blue }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual       { bg = bg1 }, -- Visual mode selection
    VisualNOS    { bg = bg1 }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg   { fg = red }, -- Warning messages
    Whitespace   { fg = grey }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    Winseparator { fg = bg1, bg = "none" }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    WildMenu     { fg = bg0, bg = blue }, -- Current match in 'wildmenu' completion

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    Comment        { fg = "#535965" }, -- Any comment

    Constant       { fg = cyan }, -- (*) Any constant
    String         { fg = green }, --   A string constant: "this is a string"
    Character      { fg = orange }, --   A character constant: 'c', '\n'
    Number         { fg = orange }, --   A number constant: 234, 0xff
    Boolean        { fg = orange }, --   A boolean constant: TRUE, false
    Float          { fg = orange, }, --   A floating point constant: 2.3e10

    Identifier     { fg = red, }, -- (*) Any variable name
    Function       { fg = cyan, }, --   Function name (also: methods for classes)

    Statement      { fg = purple }, -- (*) Any statement
    Conditional    { fg = purple }, --   if, then, else, endif, switch, etc.
    Repeat         { fg = purple }, --   for, do, while, etc.
    Label          { fg = purple }, --   case, default, etc.
    Operator       { fg = purple }, --   "sizeof", "+", "*", etc.
    Keyword        { fg = purple }, --   any other keyword
    Exception      { fg = purple }, --   try, catch, throw

    PreProc        { fg = purple }, -- (*) Generic Preprocessor
    Include        { fg = purple }, --   Preprocessor #include
    Define         { fg = purple }, --   Preprocessor #define
    Macro          { fg = red }, --   Same as Define
    PreCondit      { fg = purple }, --   Preprocessor #if, #else, #endif, etc.

    Type           { fg = yellow }, -- (*) int, long, char, etc.
    StorageClass   { fg = yellow }, --   static, register, volatile, etc.
    Structure      { fg = yellow }, --   struct, union, enum, etc.
    Typedef        { fg = purple }, --   A typedef

    Special        { fg = red }, -- (*) Any special symbol
    SpecialChar    { fg = red }, --   Special character in a constant
    Tag            { fg = green }, --   You can use CTRL-] on this
    Delimiter      { fg = lightgrey }, --   Character that needs attention
    SpecialComment { fg = grey }, --   Special things inside a comment (e.g. '\n')
    Debug          { fg = yellow }, --   Debugging statements

    Underlined     { fg = fg, gui = "underline" }, -- Text that stands out, HTML links
    -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    Error          { fg = purple }, -- Any erroneous construct
    Todo           { fg = red, gui = "italics" }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- Used for highlighting "text" references
    -- LspReferenceRead            { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- DiagnosticError            { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticWarn             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticInfo             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticHint             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    -- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
    -- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
    -- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
    -- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.

    -- Tree-Sitter syntax groups.
    --
    -- See :h treesitter-highlight-groups, some groups may not be listed,
    -- submit a PR fix to lush-template!
    --
    -- Tree-Sitter groups are defined with an "@" symbol, which must be
    -- specially handled to be valid lua code, we do this via the special
    -- sym function. The following are all valid ways to call the sym function,
    -- for more details see https://www.lua.org/pil/5.html
    --
    -- sym("@text.literal")
    -- sym('@text.literal')
    -- sym"@text.literal"
    -- sym'@text.literal'
    --
    -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

    sym"@text.literal"      { fg = grey }, -- Comment
    sym"@text.reference"    { fg = blue }, -- Identifier
    sym"@text.title"        { fg = orange, gui = "bold" }, -- Title
    sym"@text.uri"          { fg = cyan }, -- Underlined
    sym"@text.underline"    { fg = fg, gui = "underline" }, -- Underlined
    sym"@text.todo"         { fg = red, gui = "italic" }, -- Todo
    sym"@comment"           { fg = grey }, -- Comment
    sym"@punctuation"       { fg = grey }, -- Delimiter
    sym"@constant"          { fg = orange }, -- Constant
    sym"@constant.builtin"  { fg = orange }, -- Special
    sym"@constant.macro"    { fg = orange }, -- Define
    sym"@define"            { fg = purple }, -- Define
    sym"@macro"             { fg = orange }, -- Macro
    sym"@string"            { fg = green }, -- String
    sym"@string.escape"     { fg = red }, -- SpecialChar
    sym"@string.special"    { fg = red }, -- SpecialChar
    sym"@character"         { fg = orange }, -- Character
    sym"@character.special" { fg = red }, -- SpecialChar
    sym"@number"            { fg = orange }, -- Number
    sym"@boolean"           { fg = orange }, -- Boolean
    sym"@float"             { fg = orange }, -- Float
    sym"@function"          { fg = blue, }, -- Function
    sym"@function.builtin"  { fg = cyan }, -- Special
    sym"@function.macro"    { fg = cyan }, -- Macro
    sym"@parameter"         { fg = yellow }, -- Identifier
    sym"@method"            { fg = blue }, -- Function
    sym"@field"             { fg = cyan }, -- Identifier
    sym"@property"          { fg = cyan }, -- Identifier
    sym"@constructor"       { fg = yellow, gui = "bold" }, -- Special
    sym"@conditional"       { fg = purple }, -- Conditional
    sym"@repeat"            { fg = purple }, -- Repeat
    sym"@label"             { fg = red }, -- Label
    sym"@operator"          { fg = red }, -- Operator
    sym"@keyword"           { fg = purple }, -- Keyword
    sym"@exception"         { fg = purple }, -- Exception
    sym"@variable"          { fg = fg }, -- Identifier
    sym"@type"              { fg = yellow }, -- Type
    sym"@type.definition"   { fg = yellow }, -- Typedef
    sym"@storageclass"      { fg = yellow }, -- StorageClass
    sym"@structure"         { fg = yellow }, -- Structure
    sym"@namespace"         { fg = yellow }, -- Identifier
    sym"@include"           { fg = purple }, -- Include
    sym"@preproc"           { fg = purple }, -- PreProc
    sym"@debug"             { fg = yellow }, -- Debug
    sym"@tag"               { fg = purple }, -- Tag
}
end)

return theme

