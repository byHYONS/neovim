return {
   "folke/noice.nvim",
   event = "VeryLazy",
   config = function()
      require("noice").setup({
         lsp = {
            override = {
               ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
               ["vim.lsp.util.stylize_markdown"] = true,
               ["cmp.entry.get_documentation"] = true,
            },
         },
         presets = {
            bottom_search = true, -- Sposta la barra di ricerca in basso
            command_palette = true, -- Trasforma la linea di comando in una palette flottante
            long_message_to_split = true, -- Invia i messaggi lunghi a uno split
            inc_rename = false, -- Disattiva l'inc-renaming per usare la linea di comando standard
            lsp_doc_border = true, --  Bordo ai documenti LSP
         },
      })
   end,
   dependencies = {
      "MunifTanjim/nui.nvim", -- Necessario per le finestre flottanti di Noice
      "rcarriga/nvim-notify", -- Plugin per notifiche visive in Neovim
   },
}
