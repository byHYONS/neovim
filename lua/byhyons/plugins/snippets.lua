return {
  "L3MON4D3/LuaSnip",
  config = function()
    local ls = require("luasnip")
    -- Carica gli snippet dalla tua directory personalizzata
    require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/snippets" })

    -- Configura LuaSnip (opzionale, personalizza a tuo piacimento)
    ls.config.set_config({
      history = true, -- Mantieni la cronologia degli snippet espansi per poterli annullare
      updateevents = "TextChanged,TextChangedI", -- Aggiorna lo snippet durante la digitazione
      enable_autosnippets = true, -- Abilita gli snippet automatici
    })
  end,
}
