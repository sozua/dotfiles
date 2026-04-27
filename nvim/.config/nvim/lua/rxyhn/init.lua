-- Rxyhn colorscheme
-- Credits: https://github.com/rxyhn

local M = {}

M.colors = {
  -- Base colors
  bg = "#061115",
  bg_dark = "#000a0e",
  bg_light = "#0d181c",
  bg_highlight = "#131e22",
  bg_visual = "#1c272b",

  fg = "#D9D7D6",
  fg_dark = "#4f5a5e",
  fg_gutter = "#313c40",

  -- UI elements
  border = "#222d31",
  selection = "#242f33",
  comment = "#455054",

  -- Syntax colors
  red = "#DF5B61",
  orange = "#E89982",
  yellow = "#ecd28b",
  green = "#78B892",
  cyan = "#67AFC1",
  blue = "#6791C9",
  purple = "#C488EC",
  pink = "#F16269",

  -- Variants
  bright_red = "#f26e74",
  bright_green = "#8CD7AA",
  bright_blue = "#79AAEB",
  teal = "#7ACFE4",

  -- Git
  git_add = "#78B892",
  git_change = "#6791C9",
  git_delete = "#DF5B61",

  -- Diagnostics
  error = "#DF5B61",
  warn = "#ecd28b",
  info = "#6791C9",
  hint = "#7ACFE4",
}

function M.setup()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "rxyhn"

  local c = M.colors
  local hl = vim.api.nvim_set_hl

  -- Editor
  hl(0, "Normal", { fg = c.fg, bg = c.bg })
  hl(0, "NormalFloat", { fg = c.fg, bg = c.bg_dark })
  hl(0, "FloatBorder", { fg = c.border, bg = c.bg_dark })
  hl(0, "Cursor", { fg = c.bg, bg = c.fg })
  hl(0, "CursorLine", { bg = c.bg_highlight })
  hl(0, "CursorColumn", { bg = c.bg_highlight })
  hl(0, "ColorColumn", { bg = c.bg_light })
  hl(0, "LineNr", { fg = c.fg_gutter })
  hl(0, "CursorLineNr", { fg = c.yellow })
  hl(0, "SignColumn", { fg = c.fg_gutter, bg = c.bg })
  hl(0, "VertSplit", { fg = c.border })
  hl(0, "WinSeparator", { fg = c.border })
  hl(0, "Folded", { fg = c.blue, bg = c.bg_light })
  hl(0, "FoldColumn", { fg = c.comment })
  hl(0, "NonText", { fg = c.fg_gutter })
  hl(0, "SpecialKey", { fg = c.fg_gutter })
  hl(0, "Whitespace", { fg = c.fg_gutter })

  -- Search
  hl(0, "Search", { fg = c.bg, bg = c.yellow })
  hl(0, "IncSearch", { fg = c.bg, bg = c.orange })
  hl(0, "CurSearch", { fg = c.bg, bg = c.orange })
  hl(0, "Substitute", { fg = c.bg, bg = c.red })

  -- Visual
  hl(0, "Visual", { bg = c.bg_visual })
  hl(0, "VisualNOS", { bg = c.bg_visual })

  -- Pmenu (completion menu)
  hl(0, "Pmenu", { fg = c.fg, bg = c.bg_dark })
  hl(0, "PmenuSel", { fg = c.bg, bg = c.green })
  hl(0, "PmenuSbar", { bg = c.bg_light })
  hl(0, "PmenuThumb", { bg = c.fg_gutter })

  -- Statusline
  hl(0, "StatusLine", { fg = c.fg, bg = "#0A1519" })
  hl(0, "StatusLineNC", { fg = c.comment, bg = "#0A1519" })

  -- Tabline
  hl(0, "TabLine", { fg = c.comment, bg = c.bg_dark })
  hl(0, "TabLineFill", { bg = c.bg_dark })
  hl(0, "TabLineSel", { fg = c.fg, bg = c.bg })

  -- Diff
  hl(0, "DiffAdd", { bg = "#1a2f25" })
  hl(0, "DiffChange", { bg = "#1a2535" })
  hl(0, "DiffDelete", { fg = c.red, bg = "#2a1520" })
  hl(0, "DiffText", { bg = "#2a3545" })

  -- Messages
  hl(0, "ErrorMsg", { fg = c.error })
  hl(0, "WarningMsg", { fg = c.warn })
  hl(0, "ModeMsg", { fg = c.fg })
  hl(0, "MoreMsg", { fg = c.green })
  hl(0, "Question", { fg = c.blue })

  -- Spelling
  hl(0, "SpellBad", { undercurl = true, sp = c.error })
  hl(0, "SpellCap", { undercurl = true, sp = c.warn })
  hl(0, "SpellLocal", { undercurl = true, sp = c.info })
  hl(0, "SpellRare", { undercurl = true, sp = c.hint })

  -- Syntax
  hl(0, "Comment", { fg = c.comment, italic = true })
  hl(0, "Constant", { fg = c.orange })
  hl(0, "String", { fg = c.green })
  hl(0, "Character", { fg = c.green })
  hl(0, "Number", { fg = c.orange })
  hl(0, "Boolean", { fg = c.orange })
  hl(0, "Float", { fg = c.orange })
  hl(0, "Identifier", { fg = c.fg })
  hl(0, "Function", { fg = c.blue })
  hl(0, "Statement", { fg = c.purple })
  hl(0, "Conditional", { fg = c.purple })
  hl(0, "Repeat", { fg = c.purple })
  hl(0, "Label", { fg = c.purple })
  hl(0, "Operator", { fg = c.cyan })
  hl(0, "Keyword", { fg = c.purple })
  hl(0, "Exception", { fg = c.purple })
  hl(0, "PreProc", { fg = c.cyan })
  hl(0, "Include", { fg = c.purple })
  hl(0, "Define", { fg = c.purple })
  hl(0, "Macro", { fg = c.cyan })
  hl(0, "PreCondit", { fg = c.cyan })
  hl(0, "Type", { fg = c.yellow })
  hl(0, "StorageClass", { fg = c.yellow })
  hl(0, "Structure", { fg = c.yellow })
  hl(0, "Typedef", { fg = c.yellow })
  hl(0, "Special", { fg = c.cyan })
  hl(0, "SpecialChar", { fg = c.pink })
  hl(0, "Tag", { fg = c.red })
  hl(0, "Delimiter", { fg = c.fg })
  hl(0, "SpecialComment", { fg = c.comment })
  hl(0, "Debug", { fg = c.orange })
  hl(0, "Underlined", { underline = true })
  hl(0, "Bold", { bold = true })
  hl(0, "Italic", { italic = true })
  hl(0, "Ignore", { fg = c.bg })
  hl(0, "Error", { fg = c.error })
  hl(0, "Todo", { fg = c.bg, bg = c.yellow, bold = true })

  -- Treesitter
  hl(0, "@variable", { fg = c.fg })
  hl(0, "@variable.builtin", { fg = c.red })
  hl(0, "@variable.parameter", { fg = c.fg })
  hl(0, "@variable.member", { fg = c.teal })
  hl(0, "@constant", { fg = c.orange })
  hl(0, "@constant.builtin", { fg = c.orange })
  hl(0, "@constant.macro", { fg = c.orange })
  hl(0, "@module", { fg = c.yellow })
  hl(0, "@label", { fg = c.purple })
  hl(0, "@string", { fg = c.green })
  hl(0, "@string.escape", { fg = c.cyan })
  hl(0, "@string.special", { fg = c.cyan })
  hl(0, "@character", { fg = c.green })
  hl(0, "@number", { fg = c.orange })
  hl(0, "@boolean", { fg = c.orange })
  hl(0, "@float", { fg = c.orange })
  hl(0, "@function", { fg = c.blue })
  hl(0, "@function.builtin", { fg = c.cyan })
  hl(0, "@function.macro", { fg = c.cyan })
  hl(0, "@function.method", { fg = c.blue })
  hl(0, "@constructor", { fg = c.yellow })
  hl(0, "@keyword", { fg = c.purple })
  hl(0, "@keyword.function", { fg = c.purple })
  hl(0, "@keyword.operator", { fg = c.cyan })
  hl(0, "@keyword.return", { fg = c.purple })
  hl(0, "@keyword.conditional", { fg = c.purple })
  hl(0, "@keyword.repeat", { fg = c.purple })
  hl(0, "@keyword.import", { fg = c.purple })
  hl(0, "@keyword.exception", { fg = c.purple })
  hl(0, "@operator", { fg = c.cyan })
  hl(0, "@punctuation.delimiter", { fg = c.fg_dark })
  hl(0, "@punctuation.bracket", { fg = c.fg })
  hl(0, "@punctuation.special", { fg = c.cyan })
  hl(0, "@type", { fg = c.yellow })
  hl(0, "@type.builtin", { fg = c.yellow })
  hl(0, "@type.definition", { fg = c.yellow })
  hl(0, "@type.qualifier", { fg = c.purple })
  hl(0, "@attribute", { fg = c.cyan })
  hl(0, "@property", { fg = c.teal })
  hl(0, "@tag", { fg = c.red })
  hl(0, "@tag.attribute", { fg = c.yellow })
  hl(0, "@tag.delimiter", { fg = c.fg_dark })
  hl(0, "@comment", { fg = c.comment, italic = true })

  -- LSP Semantic tokens
  hl(0, "@lsp.type.namespace", { link = "@module" })
  hl(0, "@lsp.type.type", { link = "@type" })
  hl(0, "@lsp.type.class", { link = "@type" })
  hl(0, "@lsp.type.enum", { link = "@type" })
  hl(0, "@lsp.type.interface", { link = "@type" })
  hl(0, "@lsp.type.struct", { link = "@type" })
  hl(0, "@lsp.type.parameter", { link = "@variable.parameter" })
  hl(0, "@lsp.type.property", { link = "@property" })
  hl(0, "@lsp.type.function", { link = "@function" })
  hl(0, "@lsp.type.method", { link = "@function.method" })
  hl(0, "@lsp.type.macro", { link = "@function.macro" })
  hl(0, "@lsp.type.decorator", { link = "@attribute" })

  -- Diagnostics
  hl(0, "DiagnosticError", { fg = c.error })
  hl(0, "DiagnosticWarn", { fg = c.warn })
  hl(0, "DiagnosticInfo", { fg = c.info })
  hl(0, "DiagnosticHint", { fg = c.hint })
  hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = c.error })
  hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = c.warn })
  hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = c.info })
  hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = c.hint })
  hl(0, "DiagnosticVirtualTextError", { fg = c.error, bg = "#1a1015" })
  hl(0, "DiagnosticVirtualTextWarn", { fg = c.warn, bg = "#1a1a15" })
  hl(0, "DiagnosticVirtualTextInfo", { fg = c.info, bg = "#101520" })
  hl(0, "DiagnosticVirtualTextHint", { fg = c.hint, bg = "#101a1a" })

  -- Git signs
  hl(0, "GitSignsAdd", { fg = c.git_add })
  hl(0, "GitSignsChange", { fg = c.git_change })
  hl(0, "GitSignsDelete", { fg = c.git_delete })

  -- Telescope
  hl(0, "TelescopeNormal", { fg = c.fg, bg = c.bg_dark })
  hl(0, "TelescopeBorder", { fg = c.border, bg = c.bg_dark })
  hl(0, "TelescopePromptNormal", { fg = c.fg, bg = c.bg_light })
  hl(0, "TelescopePromptBorder", { fg = c.bg_light, bg = c.bg_light })
  hl(0, "TelescopePromptTitle", { fg = c.bg, bg = c.green })
  hl(0, "TelescopePreviewTitle", { fg = c.bg, bg = c.blue })
  hl(0, "TelescopeResultsTitle", { fg = c.bg_dark, bg = c.bg_dark })
  hl(0, "TelescopeSelection", { bg = c.bg_highlight })
  hl(0, "TelescopeMatching", { fg = c.yellow, bold = true })

  -- NvimTree / Neo-tree
  hl(0, "NvimTreeNormal", { fg = c.fg, bg = c.bg_dark })
  hl(0, "NvimTreeFolderIcon", { fg = c.blue })
  hl(0, "NvimTreeFolderName", { fg = c.blue })
  hl(0, "NvimTreeOpenedFolderName", { fg = c.blue })
  hl(0, "NvimTreeRootFolder", { fg = c.purple, bold = true })
  hl(0, "NvimTreeSpecialFile", { fg = c.yellow })
  hl(0, "NeoTreeNormal", { fg = c.fg, bg = c.bg_dark })
  hl(0, "NeoTreeNormalNC", { fg = c.fg, bg = c.bg_dark })

  -- Indent guides
  hl(0, "IndentBlanklineChar", { fg = c.bg_highlight })
  hl(0, "IblIndent", { fg = c.bg_highlight })
  hl(0, "IblScope", { fg = c.fg_gutter })

  -- Which-key
  hl(0, "WhichKey", { fg = c.cyan })
  hl(0, "WhichKeyGroup", { fg = c.blue })
  hl(0, "WhichKeyDesc", { fg = c.fg })
  hl(0, "WhichKeySeparator", { fg = c.comment })
  hl(0, "WhichKeyFloat", { bg = c.bg_dark })

  -- Lazy.nvim
  hl(0, "LazyNormal", { fg = c.fg, bg = c.bg_dark })
  hl(0, "LazyButton", { fg = c.fg, bg = c.bg_light })
  hl(0, "LazyButtonActive", { fg = c.bg, bg = c.green })
  hl(0, "LazyH1", { fg = c.bg, bg = c.green, bold = true })

  -- Notify
  hl(0, "NotifyERRORBorder", { fg = c.error })
  hl(0, "NotifyWARNBorder", { fg = c.warn })
  hl(0, "NotifyINFOBorder", { fg = c.info })
  hl(0, "NotifyDEBUGBorder", { fg = c.comment })
  hl(0, "NotifyTRACEBorder", { fg = c.purple })
  hl(0, "NotifyERRORIcon", { fg = c.error })
  hl(0, "NotifyWARNIcon", { fg = c.warn })
  hl(0, "NotifyINFOIcon", { fg = c.info })
  hl(0, "NotifyDEBUGIcon", { fg = c.comment })
  hl(0, "NotifyTRACEIcon", { fg = c.purple })
  hl(0, "NotifyERRORTitle", { fg = c.error })
  hl(0, "NotifyWARNTitle", { fg = c.warn })
  hl(0, "NotifyINFOTitle", { fg = c.info })
  hl(0, "NotifyDEBUGTitle", { fg = c.comment })
  hl(0, "NotifyTRACETitle", { fg = c.purple })

  -- Cmp
  hl(0, "CmpItemAbbr", { fg = c.fg })
  hl(0, "CmpItemAbbrMatch", { fg = c.yellow, bold = true })
  hl(0, "CmpItemAbbrMatchFuzzy", { fg = c.yellow, bold = true })
  hl(0, "CmpItemMenu", { fg = c.comment })
  hl(0, "CmpItemKindDefault", { fg = c.fg })
  hl(0, "CmpItemKindKeyword", { fg = c.purple })
  hl(0, "CmpItemKindVariable", { fg = c.fg })
  hl(0, "CmpItemKindConstant", { fg = c.orange })
  hl(0, "CmpItemKindReference", { fg = c.fg })
  hl(0, "CmpItemKindValue", { fg = c.orange })
  hl(0, "CmpItemKindFunction", { fg = c.blue })
  hl(0, "CmpItemKindMethod", { fg = c.blue })
  hl(0, "CmpItemKindConstructor", { fg = c.yellow })
  hl(0, "CmpItemKindClass", { fg = c.yellow })
  hl(0, "CmpItemKindInterface", { fg = c.yellow })
  hl(0, "CmpItemKindStruct", { fg = c.yellow })
  hl(0, "CmpItemKindEvent", { fg = c.yellow })
  hl(0, "CmpItemKindEnum", { fg = c.yellow })
  hl(0, "CmpItemKindUnit", { fg = c.orange })
  hl(0, "CmpItemKindModule", { fg = c.yellow })
  hl(0, "CmpItemKindProperty", { fg = c.teal })
  hl(0, "CmpItemKindField", { fg = c.teal })
  hl(0, "CmpItemKindTypeParameter", { fg = c.yellow })
  hl(0, "CmpItemKindEnumMember", { fg = c.teal })
  hl(0, "CmpItemKindOperator", { fg = c.cyan })
  hl(0, "CmpItemKindSnippet", { fg = c.green })
  hl(0, "CmpItemKindText", { fg = c.fg })
  hl(0, "CmpItemKindFile", { fg = c.fg })
  hl(0, "CmpItemKindFolder", { fg = c.blue })
  hl(0, "CmpItemKindColor", { fg = c.pink })

  -- Harpoon
  hl(0, "HarpoonWindow", { fg = c.fg, bg = c.bg_dark })
  hl(0, "HarpoonBorder", { fg = c.border, bg = c.bg_dark })
end

return M
