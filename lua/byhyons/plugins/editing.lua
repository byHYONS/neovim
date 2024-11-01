return {
  -- Plugin per cursori multipli
  {
    "mg979/vim-visual-multi",
    branch = "master",
    event = "VeryLazy",
  },

  -- Plugin per spostare righe con le frecce
  {
    "fedepujol/move.nvim",
    event = "VeryLazy",
    config = function()
      require("move").setup({
        -- Configurazioni opzionali, lasciare vuoto per impostazioni di default
        mappings = {
          move_line_up = "<A-Up>", -- Alt (Option) + Freccia su
          move_line_down = "<A-Down>", -- Alt (Option) + Freccia giù
          move_block_up = "<A-S-Up>", -- Alt + Shift + Freccia su
          move_block_down = "<A-S-Down>", -- Alt + Shift + Freccia giù
        },
      })
    end,
  },
}
