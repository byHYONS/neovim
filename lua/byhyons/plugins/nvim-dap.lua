-- Debug del codice in tempo reale
return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "mfussenegger/nvim-dap-python",
  },
  event = "VeryLazy",
  config = function()
    -- configurazione per Python
    require("configs.dap_python")
    --  caricare qui altre configurazioni per altri linguaggi
    require("byhyons.core.keymaps")
  end,
}
