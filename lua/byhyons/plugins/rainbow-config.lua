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
      -- highlight = {
      --   "RainbowDelimiterRed",
      --   "RainbowDelimiterYellow",
      --   "RainbowDelimiterBlue",
      --   "RainbowDelimiterOrange",
      --   "RainbowDelimiterGreen",
      --   "RainbowDelimiterViolet",
      --   "RainbowDelimiterCyan",
      -- },
    }

    -- Definisci i colori per ciascun delimitatore
    -- vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#E8AC5B" })
    -- vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#FF6B8C" })
    -- vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#6FA2FE" })
    -- vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#A37ADE" })
    -- vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#91Cf5B" })
    -- vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#FF9855" })
    -- vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#5ED1FF" })
  end,
}
