-- NOTIFICHE DI NVIM

return {
  "rcarriga/nvim-notify",
  -- tag = "v3.15.0",
  version = "*",
  opts = {
    stages = "fade_in_slide_out",
    timeout = 1500,
    level = "info", -- Livello di notifica di default (info, warn, error)
    max_width = 50, -- Larghezza massima della notifica
    max_height = 10, -- Altezza massima della notifica
    background_colour = "#011423", -- Colore di sfondo per la trasparenza
    icons = {
      ERROR = "",
      WARN = "",
      INFO = "",
      DEBUG = "",
      TRACE = "✎",
    },
    time_formats = {}, -- Lascia vuoto per usare il formato di default
    on_open = nil, -- Funzione opzionale da eseguire all'apertura
    on_close = nil, -- Funzione opzionale da eseguire alla chiusura
  },
  config = function(_, opts)
    require("notify").setup(opts)
    vim.notify = require("notify")
  end,
}
