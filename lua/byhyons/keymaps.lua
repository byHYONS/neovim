local M = {}

-- Definisco funzione setup per i keymaps
M.setup = function()
  local opts = { noremap = true, silent = true }

  -- Mappa per spostarsi tra le tab
  vim.api.nvim_set_keymap("n", "gz", ":tabnext<CR>", opts) -- Vai alla tab successiva
  vim.api.nvim_set_keymap("n", "gZ", ":tabprevious<CR>", opts) -- Vai alla tab precedente

  -- Mappa per spostarsi tra tab con leader
  vim.keymap.set("n", "<leader>1", "1gt", { desc = "Vai alla tab #1" })
  vim.keymap.set("n", "<leader>2", "2gt", { desc = "Vai alla tab #2" })
  vim.keymap.set("n", "<leader>3", "3gt", { desc = "Vai alla tab #3" })
  vim.keymap.set("n", "<leader>4", "4gt", { desc = "Vai alla tab #4" })
  vim.keymap.set("n", "<leader>5", "5gt", { desc = "Vai alla tab #5" })
  vim.keymap.set("n", "<leader>6", "6gt", { desc = "Vai alla tab #6" })
  vim.keymap.set("n", "<leader>7", "7gt", { desc = "Vai alla tab #7" })
  vim.keymap.set("n", "<leader>8", "8gt", { desc = "Vai alla tab #8" })
  vim.keymap.set("n", "<leader>9", "9gt", { desc = "Vai alla tab #9" })
  vim.keymap.set("n", "<leader>0", "0gt", { desc = "Vai alla tab #0" })
end

return M
