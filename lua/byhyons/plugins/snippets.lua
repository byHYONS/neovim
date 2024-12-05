return {
  "L3MON4D3/LuaSnip",
  config = function()
    local ls = require("luasnip")
    -- Carica gli snippet in formato Lua
    require("luasnip.loaders.from_lua").lazy_load({
      paths = { vim.fn.expand("~/.config/nvim/snippets") },
    })
    -- Carica snippet in formato VS Code
    require("luasnip.loaders.from_vscode").lazy_load({
      paths = { vim.fn.expand("~/.config/nvim/snippets") },
    })

    -- Configura LuaSnip (opzionale, personalizza a tuo piacimento)
    ls.config.set_config({
      history = true, -- Mantieni la cronologia degli snippet espansi per poterli annullare
      updateevents = "TextChanged,TextChangedI", -- Aggiorna lo snippet durante la digitazione
      enable_autosnippets = true, -- Abilita gli snippet automatici
    })
  end,
}
