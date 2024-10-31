return {
  "HiPhish/rainbow-delimiters.nvim",
  config = function()
    local rainbow_delimiters = require("rainbow-delimiters")

    -- Definizione della strategia e delle query per la colorazione delle parentesi
    vim.g.rainbow_delimiters = {
      strategy = {
        [""] = rainbow_delimiters.strategy["global"], -- Strategia globale per i delimitatori
        lua = rainbow_delimiters.strategy["global"], -- Strategia locale per Lua
      },
      query = {
        [""] = "rainbow-delimiters", -- Usa rainbow-delimiters per tutti i file
        lua = "rainbow-blocks", -- Usa rainbow-blocks per Lua
      },
      highlight = {
        "RainbowDelimiterRed",
        "RainbowDelimiterYellow",
        "RainbowDelimiterBlue",
        "RainbowDelimiterOrange",
        "RainbowDelimiterGreen",
        "RainbowDelimiterViolet",
        "RainbowDelimiterCyan",
      },
    }

    -- Definisci i colori per ciascun delimitatore
    vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#EDC70D" }) -- Colore gialloq
    vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#DA70D6" }) -- Colore viola chiaroq
    vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#179AF6" }) -- Colore blu
    vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#FF8C00" }) -- Colore arancione
    vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#77C0FC" }) -- Colore azzurro chiaro
    vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#FF7194" }) -- Colore rosso
    vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#FF79C6" }) -- Colore viola
  end,
}
