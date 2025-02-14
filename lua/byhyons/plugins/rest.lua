-- Rest HTTP
return {
  "rest-nvim/rest.nvim",
  dependencies = { "nvim-lua/plenary.nvim" }, -- Plenary è richiesto
  ft = "http", -- Carica solo nei file .http
  config = function()
    require("rest-nvim").setup({
      result_split_horizontal = false, -- Risultato in un buffer separato
      result_split_in_place = false, -- Evita di sostituire il buffer corrente
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    })
  end,
}
