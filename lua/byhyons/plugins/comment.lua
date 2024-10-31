return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    -- import comment plugin safely
    local comment = require("Comment")

    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    -- enable comment
    comment.setup({
      padding = true, -- Aggiunge padding ai commenti
      sticky = false, -- Non mantiene il cursore fermo
      ignore = "^$", -- Ignora le linee vuote
      mappings = { -- Abilita le scorciatoie da tastiera
        basic = true,
        extra = false,
      },
      toggler = { -- Imposta i toggle per commentare
        line = "gcc", -- Commenta singola linea
        block = "gbc", -- Commenta blocco
      },
      opleader = { -- Definisce i leader per i commenti
        line = "gc", -- Leader per commentare singole linee
        block = "gb", -- Leader per commentare blocchi
      },
      extra = { -- Mappature extra
        above = "gcO", -- Commenta sopra la riga corrente
        below = "gco", -- Commenta sotto la riga corrente
        eol = "gcA", -- Commenta alla fine della riga corrente
      },
      pre_hook = ts_context_commentstring.create_pre_hook(), -- Pre-hook per gestire linguaggi con context (es. tsx, svelte)
      post_hook = function(ctx)
        -- Esempio di azione nel post_hook
        -- Puoi eseguire una funzione dopo aver commentato, ad esempio loggare un messaggio
        if ctx.range.srow ~= ctx.range.erow then
          print("Hai commentato un blocco di righe!")
        else
          print("Hai commentato una singola riga!")
        end
      end,
    })
  end,
}
