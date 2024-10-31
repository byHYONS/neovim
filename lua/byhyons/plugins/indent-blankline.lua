return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = {
      char = "│", -- Simbolo di indentazione
    },
    scope = {
      enabled = false, -- Disabilita lo scope highlighting
    },
  },
  config = function()
    require("ibl").setup({
      indent = {
        char = "│",
      },
      scope = {
        enabled = false, -- Disabilita lo scope per evitare interferenze
      },
    })
  end,
}
