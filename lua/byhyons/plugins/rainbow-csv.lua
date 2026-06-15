-- Evidenzia ogni colonna dei file CSV con un colore diverso.
return {
  "mechatroner/rainbow_csv",
  ft = { "csv", "tsv" }, -- Carica il plugin solo per file CSV e TSV
  config = function()
    -- Configurazione opzionale specifica può essere inserita qui
  end,
}
