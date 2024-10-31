return {
  "nvim-treesitter/playground",
  config = function()
    require("nvim-treesitter.configs").setup({
      playground = {
        enable = true,
        updatetime = 25, -- Tempo di aggiornamento per il playground in millisecondi
        persist_queries = false, -- True se vuoi che persistano le query tra le sessioni
      },
    })
  end,
}

-- vedere la struttura dell’albero di sintassi:
-- :TSPlaygroundToggle

-- vedere highlight groups applicati alla parola o al simbolo sotto il cursore:
-- :TSHighlightCapturesUnderCursor

-- vedere gruppi di sintassi con vim-blade:
-- :echo synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
