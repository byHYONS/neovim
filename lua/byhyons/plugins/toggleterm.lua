-- Terminals
return {
  "akinsho/toggleterm.nvim",
  lazy = true,
  cmd = { "ToggleTerm", "TermExec" },
  config = function()
    require("toggleterm").setup({
      size = 15,
      open_mapping = [[<leader>zz]],
      direction = "horizontal",
      shading_factor = 2,
      close_on_exit = false,
      start_in_insert = true,
      persist_mode = false,
      persist_size = true,
      shade_terminals = true,
      float_opts = { border = "curved" },

      on_open = function(term)
        vim.keymap.set("t", "<Esc>", "<C-\\><C-n><C-w>k<C-w>k", {
          buffer = term.bufnr,
          desc = "Focus Codice",
        })
      end,
    })
  end,
}
