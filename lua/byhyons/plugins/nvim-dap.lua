-- DAP • Debug del codice in tempo reale
return {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",

  dependencies = {
    "mfussenegger/nvim-dap-python",
    "nvim-telescope/telescope-dap.nvim",
  },

  config = function()
    require("configs.dap").setup()

    pcall(function()
      require("telescope").load_extension("dap")
    end)
  end,
}
