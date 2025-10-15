return {
  "RRethy/vim-illuminate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    -- definisci gli highlight (fuori da configure)
    vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#334477", fg = "NONE" })
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#334477", fg = "NONE" })
    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#334477", fg = "NONE" })

    require("illuminate").configure({
      providers = { "lsp", "treesitter", "regex" },
      delay = 150,
      under_cursor = false, -- evita il “flash” sotto al cursore
      filetypes_denylist = {
        "NvimTree",
        "alpha",
        "dashboard",
        "lazy",
        "mason",
        "TelescopePrompt",
        "help",
      },
      large_file_cutoff = 2000,
      large_file_overrides = { providers = { "treesitter" } },
    })
  end,
}
