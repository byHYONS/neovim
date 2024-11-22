-- Plugin per la conversione di px in rem
return {
  {
    "jsongerber/nvim-px-to-rem",
    config = function()
      require("nvim-px-to-rem").setup({
        root_font_size = 16, -- Dimensione del font root per la conversione
        decimal_count = 4, -- Numero di decimali da mantenere
        show_virtual_text = true, -- Mostra il valore rem convertito come testo virtuale
        add_cmp_source = true, -- Aggiunge una fonte a nvim-cmp per la conversione
        disable_keymaps = false, -- Mantiene le mappature di tasti predefinite
        filetypes = { "css", "scss", "sass" }, -- Tipi di file su cui abilitare il plugin
      })
    end,
    keys = {
      { "<leader>px", "<cmd>PxToRemCursor<CR>", desc = "Converti px a rem sotto il cursore" },
      { "<leader>pxl", "<cmd>PxToRemLine<CR>", desc = "Converti px a rem in tutta la riga" },
    },
  },

  -- Plugin per la conversione bidirezionale tra px e rem
  {
    "axelvc/unito.nvim",
    requires = { "nvim-treesitter/nvim-treesitter" }, -- Dipendenza necessaria
    config = function()
      require("unito").setup({
        rem = 16, -- Valore rem utilizzato per le conversioni
        max_decimals = 4, -- Numero massimo di decimali per i valori float
      })
    end,
    keys = {
      { "<leader>ur", "<cmd>PxToRem<CR>", desc = "Converti px a rem (Unito)" },
      { "<leader>up", "<cmd>RemToPx<CR>", desc = "Converti rem a px (Unito)" },
      { "<leader>ut", "<cmd>TogglePxRem<CR>", desc = "Alterna px/rem sotto il cursore (Unito)" },
    },
  },
}
