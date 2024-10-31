return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Aggiungi il formatter per blade
        null_ls.builtins.formatting.blade_formatter,
        -- Puoi aggiungere altri formatter e linter qui
      },
    })
  end,
}
