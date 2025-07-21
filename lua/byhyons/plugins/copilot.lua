-- COPILOT GITHUB
return {
  "github/copilot.vim",
  -- event = "InsertEnter", -- carica in automatico
  cmd = "Copilot", -- carica con :Copilot
  config = function()
    vim.g.copilot_filetypes = {
      ["*"] = true, -- abilita su tutti i file
    }
    -- mappa <Tab> per accettare la proposta di Copilot
    vim.api.nvim_set_keymap(
      "i",
      "<Tab>",
      'copilot#Accept("<Tab>")',
      { silent = true, expr = true, replace_keycodes = false }
    )
    vim.cmd("Copilot setup")
  end,
}
