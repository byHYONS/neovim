-- Analizza il codice e segnala errori, problemi e miglioramenti
return {
  "mfussenegger/nvim-lint",
  event = "VeryLazy",
  config = function()
    require("configs.lint")
  end,
}
