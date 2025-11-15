local M = {}

M.setup = function()
  vim.cmd([[
  " highlight String guifg=#06EE8C
  " highlight Keyword cterm=bold gui=bold guifg=#9572ED 
  " highlight Function guifg=#A0A0FF
  " highlight @keyword.function guifg=#9571ED
  " highlight @constructor guifg=#77C0FC
  " highlight @variable.builtin cterm=italic gui=italic guifg=#FFD847 
  " highlight Number guifg=#FFD747
  " highlight @variable.member guifg=#FE4363
  " highlight DiagnosticInfo guifg=#40E0D0
  " highlight DiagnosticHint guifg=#ADD8E6
  " highlight DiagnosticVirtualTextInfo guifg=#40E0D0
  " highlight DiagnosticVirtualTextHint guifg=#ADD8E6
   highlight @Variable guifg=#FF6B7C
  " highlight @constant guifg=#FF7B24
  " highlight @constant.builtin guifg=#EB3F5C
  " highlight @Variable.parameter guifg=#FF7B24
  " highlight @constant.parameter.builtin guifg=#72009F
  " highlight @type cterm=bold gui=bold guifg=#FFD847
  " highlight @property cterm=bold gui=bold guifg=#3498DB
  highlight @module cterm=bold gui=bold guifg=#A8FFB3
  " highlight @keyword.conditional cterm=bold gui=bold guifg=#9571ED
  " highlight @function.call cterm=bold gui=italic guifg=#FE4363
  " highlight @function.method.call cterm=bold,italic gui=bold,italic guifg=#9571ED
  " highlight @Keyword.import cterm=bold gui=bold guifg=#9571ED
  " highlight @punctuation.delimiter guifg=#FFD847
  " highlight @boolean cterm=bold,italic gui=bold,italic guifg=#FFD847
  highlight @punctuation.bracket cterm=bold gui=bold guifg=#4DA6FF
  highlight htmlTagN guifg=#FF6B7C
  " highlight htmlArg guifg=#FFD847
  highlight cssStyle cterm=bold gui=bold guifg=#9571ED
  highlight cssDefinition guifg=#FF6B7C
  " highlight @tag.attribute guifg=#FFD847
  " highlight @tag guifg=#FE4363
  " highlight @markup.heading guifg=#9AC7BC
  " highlight @punctuation.bracket guifg=#4DA6FF

  highlight zshFunction cterm=bold, gui=bold, guifg=#3498DB
  " highlight zshCommand guifg=#DA70D6
  highlight zshVariable guifg=#FF6B7C
  highlight zshBrackets guifg=#9AC7BC
  " highlight zshOption cterm=italic, gui=italic, guifg=#9AC7BC
  " highlight zshParameter guifg=#FF7B24
  " highlight zshOperator cterm=bold, gui=bold, guifg=#77C0FC
  " highlight zshConditional cterm=bold,italic gui=bold,italic guifg=#DA70D6
  " highlight zshKeyword cterm=bold gui=bold guifg=#9571ED
  highlight zshSubstQuoted guifg=#9AC7BC
  " highlight zshNumber guifg=#FFD747
  " highlight zshType cterm=bold, guifg=#4DA6FF
  " highlight zshBuiltin guifg=#FF7B24
  highlight zshParentheses guifg=#77C0fc
  

  " highlight QuestionComment guifg=#0000FF
  " highlight TodoComment guifg=#FFA500


  highlight NvimTreeExecFile guifg=#A6DA95
  highlight Directory cterm=bold gui=bold guifg=#77C0FC
  ]])
  -- Sovrascrive il link di default (Question) per i file eseguibili in nvim-tree

  -- Highlight Blade
  local highlights = {
    commentBlade = { fg = "#77C0FC" },
    bladeParentheses = { fg = "#FF7B24" },
    bladePhpParenBlock = { fg = "#9571ED", italic = true },
    bladeEcho = { fg = "#FE4363" },
    Operator = { fg = "#FE4363" },
    phpMethods = { fg = "#FE4363" },
    phpIdentifier = { fg = "#FE4363" },
    phpMethodsVar = { fg = "#FE4363", italic = true },
    Statement = { fg = "#77C0FC" },
    PreProc = { fg = "#3498DB" },
    htmlTagName = { fg = "#FE4363" },
    htmlSpecialTagName = { fg = "#FE4363" },
    bladeDirectiveString = { fg = "#06EE8C" },
    phpDocTags = { fg = "#9571ED" },
    bladeKeyword = { fg = "#9571ED", bold = true },
    htmlEvent = { fg = "#FFD847" },
    phpRelation = { fg = "#9AC7BC" },
    phpOperator = { fg = "#3498DB" },
  }

  for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Rimuovi la sottolineatura dai commenti
  vim.cmd([[
  highlight! DiagnosticUnderlineError gui=none
  highlight! DiagnosticUnderlineWarn gui=none
  highlight! DiagnosticUnderlineInfo gui=none
  highlight! DiagnosticUnderlineHint gui=none
  highlight! @string.special.url gui=none
]])
end

return M
-- highlight Number guifg=#4DA6FF

-- BIANCO: #e9def2
-- GIALLO: #FFD847
-- ROSSO: #FE4363
-- VIOLA: #9571ED
-- ARANCIONE: #FF7B24
-- BLUE: #3498DB
-- AZZURRO: #77C0FC
-- AZZURRO: CHIARO: #9AC7BC
-- VIOLA CHIARO: #DA70D6
-- VIOLA SCURO: #F20587
-- ARANCIONE: #FF8C00
-- VERDE: #06EE8C
-- VERDE PASTELLO: #A8FFB3
