return {
  "RRethy/vim-illuminate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("illuminate").configure({
      vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#122355", fg = "NONE" }),
      vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#122355", fg = "NONE" }),
      vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#122355", fg = "NONE" }),
      providers = {
        "lsp", -- usa il supporto LSP (se disponibile) #033259
        "treesitter", -- usa Treesitter per una migliore accuratezza
        "regex", -- fallback a regex se necessario
      },
      delay = 100, -- ritardo in millisecondi prima che l'evidenziazione appaia
      under_cursor = true, -- evidenzia anche la parola sotto il cursore (opzionale)
      filetypes_denylist = { -- eventuali filetypes per cui non abilitare l'illuminazione
        "NvimTree",
        "dashboard",
        "alpha",
      },
    })
  end,
}
