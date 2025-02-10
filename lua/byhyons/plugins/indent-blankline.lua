-- IdentBlankLine
return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = {
      char = "│", -- il carattere per le linee verticali
      highlight = { "IndentBlanklineChar" }, -- gruppo per tutti gli indent non attivi
    },
    scope = {
      enabled = true, -- abilita il context highlighting per il blocco corrente
      show_start = false, -- non mostra il marker all'inizio del blocco (evita linee orizzontali)
      show_end = false, -- non mostra il marker alla fine del blocco
      highlight = "IndentBlanklineContextChar", -- gruppo per la linea del contesto corrente
    },
  },
  config = function()
    require("ibl").setup({
      indent = {
        char = "│",
        highlight = { "IndentBlanklineChar" },
      },
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
        highlight = "IndentBlanklineContextChar",
      },
    })
  end,
}
