local M = {}

-- Definisco funzione setup per i keymaps
M.setup = function()
  local opts = { noremap = true, silent = true }

  -- Mappa per spostarsi tra tab con leader
  vim.keymap.set("n", "|1", "1gt", { desc = "Go To Tab 1" })
  vim.keymap.set("n", "|2", "2gt", { desc = "Go To Tab 2" })
  vim.keymap.set("n", "|3", "3gt", { desc = "Go To Tab 3" })
  vim.keymap.set("n", "|4", "4gt", { desc = "Go To Tab 4" })
  vim.keymap.set("n", "|5", "5gt", { desc = "Go To Tab 5" })
  vim.keymap.set("n", "|6", "6gt", { desc = "Go To Tab 6" })
  vim.keymap.set("n", "|7", "7gt", { desc = "Go To Tab 7" })
  vim.keymap.set("n", "|8", "8gt", { desc = "Go To Tab 8" })
  vim.keymap.set("n", "|9", "9gt", { desc = "Go To Tab 9" })
end

return M
