return {
  "mistweaverco/kulala.nvim",
  event = "VimEnter", -- carica all'avvio (puoi usare un altro evento se preferisci)
  keys = {
    { "<leader>k", "", desc = " Esegui API" },
    {
      "<leader>kr",
      function()
        require("kulala").run()
      end,
      desc = "Esegui Kulala",
    },
    {
      "<leader>kc",
      function()
        require("kulala").close()
      end,
      desc = "Chiudi Kulala",
    },
    {
      "<leader>ks",
      function()
        require("kulala").show_stats()
      end,
      desc = "Mostra statistiche di Kulala",
    },
    {
      "<leader>ki",
      function()
        require("kulala").inspect()
      end,
      desc = "Ispeziona Kulala",
    },
  },
  config = function()
    require("kulala").setup({
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      -- Puoi aggiungere qui eventuali opzioni di configurazione specifiche
      -- Se non serve nessuna personalizzazione, lascia vuoto
    })
  end,
}
