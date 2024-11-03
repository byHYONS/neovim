-- Plugin per il run di Python

return {
  {
    "tpope/vim-dispatch",
    lazy = true,
    cmd = { "Dispatch", "Make", "Start", "Focus" },
    config = function()
      -- Configura la mappatura della scorciatoia
      vim.api.nvim_set_keymap("n", "<leader>p", ":Dispatch python3 %<CR>", { noremap = true, silent = true })
    end,
  },
}
