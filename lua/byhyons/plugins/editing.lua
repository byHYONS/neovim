return {
  -- Plugin per cursori multipli
  -- per attivare più cursori: CRTL + N
  {
    "mg979/vim-visual-multi",
    branch = "master",
    event = "VeryLazy",
  },

  -- Plugin per spostare righe con le frecce
  {
    "fedepujol/move.nvim",
    event = "VeryLazy",
    config = function()
      require("move").setup({
        -- Configurazioni opzionali, lasciare vuoto per impostazioni di default
        set_keymaps = false,
      })
      -- Mappature personalizzate
      vim.api.nvim_set_keymap("n", "<A-Up>", ":MoveLine(-1)<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<A-Down>", ":MoveLine(1)<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("v", "<A-Up>", ":MoveBlock(-1)<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("v", "<A-Down>", ":MoveBlock(1)<CR>", { noremap = true, silent = true })
    end,
  },
}
