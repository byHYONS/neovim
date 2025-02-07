return {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  config = function()
    require("custom.configs.dap_python") -- configurazione per Python
    -- eventualmente qui puoi caricare altre configurazioni per altri linguaggi
    require("byhyons.core.keymaps") -- se hai mappature dedicate al debug
  end,
}
