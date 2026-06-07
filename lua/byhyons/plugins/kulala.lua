-- Kulala - Test API
return {
  "mistweaverco/kulala.nvim",
  event = "VimEnter", -- carica all'avvio (puoi usare un altro evento se preferisci)
  config = function()
    require("kulala").setup({
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      -- Aggiungere qui eventuali opzioni di configurazione
    })
  end,
}
