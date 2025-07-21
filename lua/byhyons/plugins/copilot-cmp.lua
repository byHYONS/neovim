-- COPILOT GITUB CMP
return {
  "zbirenbaum/copilot-cmp",
  after = "copilot.vim",
  config = function()
    require("copilot_cmp").setup({
      suggestion = { auto_trigger = true },
      panel = { enabled = false },
    })
  end,
}
