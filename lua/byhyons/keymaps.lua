local M = {}

-- Definisco funzione setup per i keymaps
M.setup = function()
  local opts = { noremap = true, silent = true }

  -- Mappa per spostarsi tra le tab
  vim.api.nvim_set_keymap("n", "<leader>tn", ":tabnew<CR>", opts) -- Apre una nuova tab
  vim.api.nvim_set_keymap("n", "<leader>to", ":tabclose<CR>", opts) -- Chiude la tab corrente
  vim.api.nvim_set_keymap("n", "gt", ":tabnext<CR>", opts) -- Vai alla tab successiva
  vim.api.nvim_set_keymap("n", "gT", ":tabprevious<CR>", opts) -- Vai alla tab precedente

  -- Per aprire il file quando il cursore è sull'albero dei file
  vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts) -- Tasto leader per aprire/chiudere il file explorer

  -- Mappature specifiche per NvimTree
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "NvimTree",
    callback = function()
      vim.api.nvim_buf_set_keymap(0, "n", "<CR>", ":edit<CR>", opts) -- Apri file con Invio
      vim.api.nvim_buf_set_keymap(0, "n", "t", ":tabedit<CR>", opts) -- Apre il file selezionato in una nuova scheda
    end,
  })
end

return M
