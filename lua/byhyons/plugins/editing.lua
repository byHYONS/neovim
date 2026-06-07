-- Plugin per cursori multipli
return {
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

      -- Trascina la riga sul cursore in alto o in basso
      vim.api.nvim_set_keymap("n", "<A-Up>", ":MoveLine(-1)<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<A-Down>", ":MoveLine(1)<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("v", "<A-Up>", ":MoveBlock(-1)<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("v", "<A-Down>", ":MoveBlock(1)<CR>", { noremap = true, silent = true })

      -- Duplica riga sul cursore in alo o in basso
      vim.api.nvim_set_keymap("n", "<A-S-Up>", "yypk", { noremap = true, silent = true }) -- Copia la riga corrente verso l'alto
      vim.api.nvim_set_keymap("n", "<A-S-Down>", "yyp", { noremap = true, silent = true }) -- Copia la riga corrente verso il basso
      vim.api.nvim_set_keymap("v", "<A-S-Up>", "y'>p '<kgv", { noremap = true, silent = true }) -- Copia il blocco selezionato verso l'alto
      vim.api.nvim_set_keymap("v", "<A-S-Down>", "y'>p`[V`]", { noremap = true, silent = true }) -- Copia il blocco selezionato verso il basso

      -- Sposta carattere sotto il cursore a destra/sinistra
      vim.keymap.set("n", "<A-Right>", "xp", { noremap = true, silent = true })
      vim.keymap.set("n", "<A-Left>", "Xph", { noremap = true, silent = true })

      -- Sposta selezione visuale a destra/sinistra
      vim.keymap.set("v", "<A-Right>", "d`]p`[v`]", { noremap = true, silent = true })
      vim.keymap.set("v", "<A-Left>", "d`[hP`[v`]", { noremap = true, silent = true })

      -- Mandare direttamente il cursore sulla dx
      vim.api.nvim_set_keymap("i", "<C-,>", "<Esc>%%a", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("i", "<C-.>", "<esc>$a", { noremap = true, silent = true })
      -- OR, for layout IT
      vim.api.nvim_set_keymap("i", "<A-Right>", "<esc>$a", { noremap = true, silent = true })

      -- Mappa <C-o> in modalità inserimento per inserire una nuova riga
      if vim.env.TMUX ~= nil then
        -- Sei dentro tmux
        vim.api.nvim_set_keymap("i", "<C-;>", "<Esc>o", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("i", "<C-l>", "<Esc>o", { noremap = true, silent = true })
      else
        -- Non sei dentro tmux
        vim.api.nvim_set_keymap("i", "<C-CR>", "<Esc>o", { noremap = true, silent = true })
      end
    end,
  },
}
