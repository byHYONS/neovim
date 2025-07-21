return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 1000
  end,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    icons = {
      mappings = true,
      colors = true,
    },
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
}
