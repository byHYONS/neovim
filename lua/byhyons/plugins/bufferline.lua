return {
  "akinsho/bufferline.nvim",
  version = "*",
  opts = {
    options = {
      mode = "tabs",
      show_buffer_icons = true, -- Abilita le icone accanto ai buffer
      show_buffer_close_icons = true,
      show_close_icon = false,
      diagnostics = "nvim_lsp", -- Se vuoi vedere le diagnostiche accanto ai buffer
      always_show_bufferline = false,
    },
  },
}
