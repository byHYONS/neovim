-- preview dei colori
return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      "*", -- Attiva per tutti i tipi di file
      css = { rgb_fn = true }, -- Attiva `rgb(...)` nel CSS
      html = { names = false }, -- Disattiva nomi dei colori in HTML
    })
  end,
}
