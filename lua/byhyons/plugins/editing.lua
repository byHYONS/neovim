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

      -- Mappature per copiare una riga o blocco selezionato verso l'alto o il basso
      vim.api.nvim_set_keymap("n", "<A-S-Up>", "yypk", { noremap = true, silent = true }) -- Copia la riga corrente verso l'alto
      vim.api.nvim_set_keymap("n", "<A-S-Down>", "yypk", { noremap = true, silent = true }) -- Copia la riga corrente verso il basso
      vim.api.nvim_set_keymap("v", "<A-S-Up>", "y'>p '<kgv", { noremap = true, silent = true }) -- Copia il blocco selezionato verso l'alto
      vim.api.nvim_set_keymap("v", "<A-S-Down>", "y'>p '>jgv", { noremap = true, silent = true }) -- Copia il blocco selezionato verso il basso

      -- Mappa <C-o> in modalità inserimento per inserire una nuova riga
      if vim.env.TMUX ~= nil then
        -- Sei dentro tmux
        vim.api.nvim_set_keymap("i", "<C-l>", "<Esc>o", { noremap = true, silent = true })
      else
        -- Non sei dentro tmux
        vim.api.nvim_set_keymap("i", "<S-CR>", "<Esc>o", { noremap = true, silent = true })
      end
      -- per scavalcare caratteri sulla destra
      vim.api.nvim_set_keymap("i", "<C-S-Right>", "<esc>$a", { noremap = true, silent = true })
    end,
  },
}
